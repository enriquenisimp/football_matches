import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_matches/common_widgets/failure_widget.dart';

import 'package:football_matches/main.dart';

void main() {
  testWidgets('Failure text widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FailureWidget(title: "title", message: "message", onTap: () {}),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pump();
  });
}
