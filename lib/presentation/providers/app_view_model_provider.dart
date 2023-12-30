import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kjbn_demo/data/repositories/game_state_repo.dart';

import '../../data/model/game_model.dart';
import '../../data/repositories/app_repo.dart';

// Definition of the AppViewModel class, extending StateNotifier with GameModel as the state
class AppViewModel extends StateNotifier<GameModel> {
  // Repositories required for managing game data and state
  final AppRepository _repository;
  final GameStateRepository _gameStateRepository;

  // Constructor initializing repositories and setting the initial state
  AppViewModel(this._repository, this._gameStateRepository)
      : super(GameModel()) {
    // Load the game state, either from saved data or default values
    loadGameState();
  }

  // Asynchronous method to load the game state
  Future<void> loadGameState() async {
    // Attempt to fetch a saved game state
    final savedState = await _gameStateRepository.fetchSavedGameModel();

    // Check if a saved state is available
    if (savedState != null) {
      // Use the saved state as the current state
      state = savedState;
    } else {
      // No saved state found, fetch default state data
      state = await _gameStateRepository.fetchData();
    }
  }

  // Asynchronous method to update the game model based on user interaction
  Future<void> updateGameModel() async {
    // Retrieve the updated model from the repository
    final updatedModel = await _repository.updateWidgetsOnTap(state);

    // Check if the update was successful
    if (updatedModel != null) {
      // Set the state to the updated model
      state = updatedModel;

      // Save the updated game state
      await _gameStateRepository.saveGameModel(updatedModel);
    }
  }

  // Method to calculate the success score based on the current game state
  int calculateSuccessScore() {
    return 100 - (state.attempts! * 10);
  }

  // New method to handle the timeout scenario
  void handleTimeout() {
    // Increment the attempts counter
    state = state.copyWith(attempts: state.attempts! + 1);

    // Display a failure message (customize this based on your UI requirements)
    state = state.copyWith(resultMessage: "Sorry, timeout! One attempt added.");

    // Save the updated game state
    _gameStateRepository.saveGameModel(state);
  }
}
