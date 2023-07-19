import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_clean_arch/core/util/input_convertor.dart';
import 'package:tdd_clean_arch/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_clean_arch/features/number_trivia/domain/usecases/get_concrete_number.dart';
import 'package:tdd_clean_arch/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailure =
    'Invalid Input - The number must be a positive integer or zero';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(Empty()) {
    on<GetTriviaForConcreteNumber>(_onGetTriviaForConcreteNumberEvent
        as EventHandler<GetTriviaForConcreteNumber, NumberTriviaState>);
  }
  Future<void> _onGetTriviaForConcreteNumberEvent(
      GetConcreteNumberTrivia event, Emitter<NumberTriviaState> emit) async {
    final inputEither =
        inputConverter.stringToUnsignedInteger(event.repository as String);

    inputEither.fold(
      (failure) => emit(
        Error(message: invalidInputFailure),
      ),
      (value) => (Empty(),),
    );
  }
}
