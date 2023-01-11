




import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/models/movie.dart';

import '../api.dart';
import '../models/movie_state.dart';
import '../services/movie_service.dart';

final movieProvider = StateNotifierProvider.family<MovieNotifier, MovieState, Categories>((ref, Categories cat) => MovieNotifier(
    MovieState(errorMessage: '', isLoaded: false,
        popularMovies: [],
      topRatedMovies: [],
      upcommingMovies: []
    ),
  cat
));

class MovieNotifier extends StateNotifier<MovieState> {
  final Categories category;

  MovieNotifier(super.state, this.category) {
    getMovieByCategory();
  }


  Future<void> getMovieByCategory() async {
    if (category == Categories.upcomming) {
      state = state.copyWith(isLoaded: true, errorMessage: '');
      final response = await MovieService.getMovieCategory(
          apiPath: Api.upcommingMovie
      );
      response.fold((l){
      state = state.copyWith(isLoaded: false, errorMessage: l);
      }, (r){
        state = state.copyWith(
            isLoaded: false, errorMessage: '', upcommingMovies: r);
      });
    } else if (category == Categories.popular) {
      state = state.copyWith(isLoaded: true, errorMessage: '');
      final response = await MovieService.getMovieCategory(
          apiPath: Api.popularMovie);
      response.fold((l) {
        state = state.copyWith(isLoaded: false, errorMessage: l);
      }, (r) {
        state =
            state.copyWith(isLoaded: false, errorMessage: '', popularMovies: r);
      });
    } else {
      state = state.copyWith(isLoaded: true, errorMessage: '');
      final response = await MovieService.getMovieCategory(
          apiPath: Api.topRatedMovie);
      response.fold((l) {
        state = state.copyWith(isLoaded: false, errorMessage: l);
      }, (r) {
        state =
            state.copyWith(isLoaded: false, errorMessage: '', topRatedMovies: r);
      });
    }

  }


}