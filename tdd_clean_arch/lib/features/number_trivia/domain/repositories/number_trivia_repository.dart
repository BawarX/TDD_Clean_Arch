import 'package:dartz/dartz.dart';
import 'package:tdd_clean_arch/core/error/failures.dart';
import 'package:tdd_clean_arch/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
