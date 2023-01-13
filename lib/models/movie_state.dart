

import 'movie.dart';

class MovieState{

  final bool isLoaded;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  final String errorMessage;

  MovieState({
    required this.errorMessage,
    required this.isLoaded,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies
  });

  MovieState copyWith({
    bool? isLoaded,
    String? errorMessage,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies
  }) {
    return MovieState(
        errorMessage: errorMessage ??  this.errorMessage,
        isLoaded: isLoaded ?? this.isLoaded,
        popularMovies: popularMovies ?? this.popularMovies,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        upcomingMovies: upcomingMovies ?? this.upcomingMovies
    );
  }



}