import 'dart:math';

class RandomNumberRepository {
  // Generate random number between 0 and 59
  int generateRandomNumber() {
    return Random().nextInt(59);
  }
}
