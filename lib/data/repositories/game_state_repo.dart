import 'package:shared_preferences/shared_preferences.dart';

import '../model/game_model.dart';

class GameStateRepository {
  // Keys for storing/retrieving data in SharedPreferences
  static const _widget2Key = 'widget2';
  static const _widget1Key = 'widget1';
  static const _resultMessageKey = 'resultMessage';
  static const _scoreKey = 'score';
  static const _attemptsKey = 'attempts';
  static const _timerValueKey = 'timerValue';

  // Fetch the saved game model from SharedPreferences
  Future<GameModel?> fetchSavedGameModel() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve individual values from SharedPreferences
    final widget2Value = prefs.getInt(_widget2Key);
    final widget1Value = prefs.getInt(_widget1Key);
    final score = prefs.getInt(_scoreKey);
    final attempts = prefs.getInt(_attemptsKey);
    final timerValue = prefs.getInt(_timerValueKey);

    // Check if all required values are present
    if (widget2Value != null &&
        widget1Value != null &&
        score != null &&
        attempts != null &&
        timerValue != null) {
      // Return a new GameModel instance with the retrieved values
      return GameModel(
        widget2Value: widget2Value,
        widget1Value: widget1Value,
        score: score,
        attempts: attempts,
        timerValue: timerValue,
      );
    }

    // Return null if any of the required values is missing
    return null;
  }

  // Fetch the initial game model or default values from SharedPreferences
  Future<GameModel> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve values from SharedPreferences with default values if not present
    return GameModel(
      widget2Value: prefs.getInt(_widget2Key) ?? 0,
      widget1Value: prefs.getInt(_widget1Key) ?? 0,
      resultMessage: prefs.getString(_resultMessageKey) ?? '',
      score: prefs.getInt(_scoreKey) ?? 0,
      attempts: prefs.getInt(_attemptsKey) ?? 0,
      timerValue: prefs.getInt(_timerValueKey) ?? 5,
    );
  }

  // Save the current game model to SharedPreferences
  Future<void> saveGameModel(GameModel model) async {
    final prefs = await SharedPreferences.getInstance();

    // Save individual values to SharedPreferences
    prefs.setInt(_widget2Key, model.widget2Value!);
    prefs.setInt(_widget1Key, model.widget1Value!);
    prefs.setString(_resultMessageKey, model.resultMessage ?? "");
    prefs.setInt(_scoreKey, model.score!);
    prefs.setInt(_attemptsKey, model.attempts!);
    prefs.setInt(_timerValueKey, model.timerValue!);
  }
}
