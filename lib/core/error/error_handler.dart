import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}


// For 404 or 500 errors
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

// For no internet connection
class NetworkFailure extends Failure {
  const NetworkFailure() : super("No Internet Connection");
}

// For 401 Unauthorized
class AuthFailure extends Failure {
  const AuthFailure() : super("Please log in again.");
}