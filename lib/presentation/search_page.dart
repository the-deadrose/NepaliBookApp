import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../providers/search_movie_provider.dart';



class SearchPage extends ConsumerWidget {

  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final movieData = ref.watch(searchProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchTextController,
                autofocus: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    hintText: 'search for movies'
                ),
                onFieldSubmitted: (val){
                  ref.read(searchProvider.notifier).getSearchMovie(val);
                },
              ),
              Expanded(
                  child: movieData.isLoaded ?
                  Center(
                      child: CircularProgressIndicator())
                      : movieData.errorMessage.isNotEmpty ?
                  Center(child: Text(movieData.errorMessage)) :
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GridView.builder(
                        itemCount: movieData.searchMovies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 2/3,
                            crossAxisCount: 3
                        ),
                        itemBuilder: (context, index){
                          return Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: movieData.searchMovies[index].poster_path,
                                errorWidget: (c, s, d){
                                  return Image.asset('assets/images/movie.png');
                                },
                                placeholder: (c, s) {
                                  return Container(
                                    height: 150.h,
                                    child: Center(
                                      child: SpinKitFadingCube(
                                        color: Colors.pink,
                                        size: 34.w,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}