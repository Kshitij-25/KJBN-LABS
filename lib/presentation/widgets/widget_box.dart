import 'package:flutter/material.dart';

class WidgetBox extends StatelessWidget {
  WidgetBox({super.key, this.widget, this.text});

  Widget? widget;
  Widget? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all(
          width: 2,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          text!,
          const Divider(
            color: Colors.black,
          ),
          widget!,
        ],
      ),
    );
  }
}
