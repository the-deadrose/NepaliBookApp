

import 'movie.dart';

class MovieState{

  final bool isLoaded;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcommingMovies;
  final String errorMessage;

  MovieState({
    required this.isLoaded,
    required this.errorMessage,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcommingMovies
  });

  MovieState copyWith({
    bool? isLoaded,
    String? errorMessage,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcommingMovies,
  }){
    return MovieState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoaded: isLoaded ?? this.isLoaded,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcommingMovies: upcommingMovies ?? this.upcommingMovies
);
}
}

// final m = MovieState(isLoaded: false, movies: [], errorMessegae: '');
// isLoaded = true;
// 2 seconds
// isLoaded = false;
// movie = [lkjjh];
// err = 'net lkjjkj 401'
