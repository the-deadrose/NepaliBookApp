import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/movie.dart';



class MovieService{
  static final dio = Dio();
  static Future<Either<String, List<Movie>>> getMovieCategory({required String apiPath}) async {
   try{
     final response = await dio.get(apiPath);
     final data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
     return Right(data);
   }on DioError catch(err){
      return Left(err.message);
   }
  }


}