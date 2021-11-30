import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure() : super("Falha no servidor");

  @override
  List<Object?> get props => [];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super("Falha de conexão");

  @override
  List<Object?> get props => [];
}
