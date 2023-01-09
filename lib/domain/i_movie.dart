import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/movie.dart';



abstract class MovieInterface{
Future<Either<String, List<Movie>>> getMovieCategory({required String apiPath});

}