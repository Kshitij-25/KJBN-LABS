// providers/app_repository_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/game_model.dart';
import '../../data/repositories/app_repo.dart';
import '../../data/repositories/game_state_repo.dart';
import '../../data/repositories/random_number_repo.dart';
import 'app_view_model_provider.dart';

// Provider definition for the AppRepository, responsible for managing game data and logic
final appRepositoryProvider = Provider<AppRepository>((ref) => AppRepository());

// Provider definition for the GameStateRepository, handling the retrieval and storage of game state
final gameStateRepositoryProvider =
    Provider<GameStateRepository>((ref) => GameStateRepository());

// Provider definition for the RandomNumberRepository, generating random numbers for the game
final randomNumberRepositoryProvider =
    Provider<RandomNumberRepository>((ref) => RandomNumberRepository());

// StateNotifierProvider for the AppViewModel, managing the application's state
final appViewModelProvider = StateNotifierProvider<AppViewModel, GameModel>(
  (ref) {
    // Retrieve instances of the repositories from their respective providers
    final repository = ref.watch(appRepositoryProvider);
    final gameStateRepository = ref.watch(gameStateRepositoryProvider);

    // Instantiate and return the AppViewModel with the required repositories
    return AppViewModel(repository, gameStateRepository);
  },
);
