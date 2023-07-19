part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
