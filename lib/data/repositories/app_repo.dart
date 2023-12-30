import '../model/game_model.dart';
import 'random_number_repo.dart';

class AppRepository {
  // Method to update game model on tapping a widget
  Future<GameModel?> updateWidgetsOnTap(GameModel currentModel) async {
    // Create instances of repositories for random numbers
    RandomNumberRepository randomNumberRepository = RandomNumberRepository();

    // Generate a new random number for Widget 2
    final newWidget2Value = randomNumberRepository.generateRandomNumber();

    // Get the current time and extract the seconds for Widget 1
    final tappedTime = DateTime.now();
    final newWidget1Value = tappedTime.second;

    // Create an updated game model with new values for Widget 2 and Widget 1
    final updatedModel = currentModel.copyWith(
      widget2Value: newWidget2Value,
      widget1Value: newWidget1Value,
    );

    // Check if conditions for success or failure are met
    if (newWidget2Value == newWidget1Value) {
      // Success: Increment the score and return the updated model
      return updatedModel.copyWith(score: updatedModel.score! + 10);
    } else {
      // Failure: Increment the attempts and return the updated model
      return updatedModel.copyWith(attempts: updatedModel.attempts! + 1);
    }
  }
}
