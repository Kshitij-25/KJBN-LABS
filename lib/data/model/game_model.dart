class GameModel {
  final int? widget2Value;
  final int? widget1Value;
  final String? resultMessage;
  final int? score;
  final int? attempts;
  final int? timerValue;

  GameModel({
    this.widget2Value,
    this.widget1Value,
    this.resultMessage,
    this.score,
    this.attempts,
    this.timerValue,
  });

  GameModel copyWith({
    int? widget2Value,
    int? widget1Value,
    String? resultMessage,
    int? score,
    int? attempts,
    int? timerValue,
  }) {
    return GameModel(
      widget2Value: widget2Value ?? this.widget2Value,
      widget1Value: widget1Value ?? this.widget1Value,
      resultMessage: resultMessage ?? this.resultMessage,
      score: score ?? this.score,
      attempts: attempts ?? this.attempts,
      timerValue: timerValue ?? this.timerValue,
    );
  }
}
