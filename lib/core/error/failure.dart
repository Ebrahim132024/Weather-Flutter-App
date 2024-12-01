abstract class Failure {
  final String message;
  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('Network error. Please check your connection.');
}

class ServerFailure extends Failure {
  ServerFailure() : super('Server error. Please try again later.');
}

class NotFoundFailure extends Failure {
  NotFoundFailure() : super('City not found. Please try another city.');
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure() : super('An unexpected error occurred.');
}
