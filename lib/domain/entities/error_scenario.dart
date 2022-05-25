import 'package:football_matches/core/enums/error_type.dart';

class ErrorScenario{
  final String message;
  final String title;
  final ErrorType errorType;

  ErrorScenario(this.message, this.title, this.errorType);
}