import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properites = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
