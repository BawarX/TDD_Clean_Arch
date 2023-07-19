import 'dart:convert';

import 'package:tdd_clean_arch/core/error/exceptions.dart';
import 'package:tdd_clean_arch/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImp implements NumberTriviaRemoteDataSource {
  final http.Client client;
  NumberTriviaRemoteDataSourceImp({required this.client});
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    final response = await client.get(
      'http://numbersapi.com/${number}' as Uri,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    final response = await client.get(
      'http://numbersapi.com/random' as Uri,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
