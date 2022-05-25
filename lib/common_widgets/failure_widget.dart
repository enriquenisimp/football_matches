import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String title;
  final String message;
  final Function() onTap;
  const FailureWidget({Key? key, required this.title, required this.message,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall,),
        const SizedBox(height: 10),
        Text(message, textAlign: TextAlign.center,),
        const SizedBox(height: 30),
        ElevatedButton(onPressed: onTap, child: const Text("Try again"))
      ],
    );
  }
}
