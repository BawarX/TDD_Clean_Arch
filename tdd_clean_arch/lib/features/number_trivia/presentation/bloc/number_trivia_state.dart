part of 'number_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {}

class NumberTriviaInitial extends NumberTriviaState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Empty extends NumberTriviaState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loading extends NumberTriviaState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;
  Loaded({required this.trivia});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Error extends NumberTriviaState {
  final String message;
  Error({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
