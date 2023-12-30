import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kjbn_demo/presentation/widgets/widget_box.dart';

import '../providers/app_repository_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countDownController = CountDownController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("KJBN LABS"),
      ),
      body: bodyWidget(context, countDownController),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SafeArea(
        bottom: true,
        child: FloatingActionButton.extended(
          onPressed: () {
            countDownController.restart();
            ref.read(appViewModelProvider.notifier).updateGameModel();
          },
          label: const Text("Click"),
        ),
      ),
    );
  }

  bodyWidget(context, CountDownController countDownController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WidgetBox(
              text: const Text(
                "Current Second",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              widget: Consumer(builder: (context, ref, _) {
                final gameModel = ref.watch(appViewModelProvider);
                return Text(gameModel.widget1Value.toString());
              }),
            ),
            WidgetBox(
              text: const Text(
                "Random Number",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              widget: Consumer(builder: (context, ref, _) {
                final gameModel = ref.watch(appViewModelProvider);
                return Text(gameModel.widget2Value.toString());
              }),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer(builder: (context, ref, _) {
            final gameModel = ref.watch(appViewModelProvider);
            final appViewModel = ref.read(appViewModelProvider);
            return WidgetBox(
              text: Text(
                gameModel.widget2Value == gameModel.widget1Value
                    ? "Success"
                    : "Sorry Try Again!",
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              widget: Text(gameModel.widget2Value == gameModel.widget1Value
                  ? "Score: ${appViewModel.score}"
                  : "Attempts: ${gameModel.attempts}"),
            );
          }),
        ),
        CircularCountDownTimer(
          duration: 5,
          initialDuration: 0,
          controller: countDownController,
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 3,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: Colors.blue,
          fillGradient: null,
          backgroundColor: null,
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          textStyle: const TextStyle(
            fontSize: 33.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textFormat: CountdownTextFormat.S,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: false,
          onStart: () {
            // Callback when the timer starts
            print('Timer started');
          },
          onComplete: () {
            // Callback when the timer completes
            print('Timer completed');
            // ref.read(appViewModelProvider.notifier).handleTimeout();
          },
        ),
      ],
    );
  }
}
