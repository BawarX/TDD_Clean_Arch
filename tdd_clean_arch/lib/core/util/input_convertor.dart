import 'package:dartz/dartz.dart';
import 'package:tdd_clean_arch/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      return Right(int.parse(str));
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
