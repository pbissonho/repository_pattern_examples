abstract class Failure {
  final String message;

  Failure(this.message);
}

class RestFailure extends Failure {
  RestFailure(String message) : super(message);
}
