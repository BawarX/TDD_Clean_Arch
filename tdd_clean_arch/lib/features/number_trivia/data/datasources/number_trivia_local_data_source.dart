import 'dart:convert';
import 'dart:js_interop';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_clean_arch/core/error/exceptions.dart';
import 'package:tdd_clean_arch/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalDataSouceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;
  NumberTriviaLocalDataSouceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    return sharedPreferences.setString(
      CACHED_NUMBER_TRIVIA,
      json.encode(
        triviaToCache.toJS,
      ),
    );
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
    if (jsonString != null) {
      return Future.value(
        NumberTriviaModel.fromJson(
          json.decode(jsonString),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
