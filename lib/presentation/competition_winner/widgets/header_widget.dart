import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsets? padding;
  const HeaderWidget({Key? key, required this.title, required this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          )),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: padding?? const EdgeInsets.only(),
        child: child,
      )
    ]);
  }
}
