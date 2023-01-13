import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_ui/models/movie.dart';
import 'package:flutter_ui/providers/movie_provider.dart';



class TabBarWidget extends StatelessWidget {
  final Categories categories;
  final String keys;
  TabBarWidget(this.categories, this.keys);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
            builder: (context, ref, child) {
              final movieData = ref.watch(movieProvider(categories));
              final data = categories == Categories.top_rated ? movieData.topRatedMovies :
              categories == Categories.upcoming ? movieData.upcomingMovies: movieData.popularMovies;
              return movieData.isLoaded ? Center(child: CircularProgressIndicator()): Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.builder(
                    key: PageStorageKey(keys),
                    itemCount: data.length,
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
                             imageUrl: data[index].poster_path,
                             errorWidget: (c, s, d){
                               return Image.asset('');
                             },
                             placeholder: (c, s){
                               return Container(
                                 height: 200.h,
                                 child: Center(
                                   child: SpinKitFadingCube(
                                     color: Colors.pink,
                                     size: 35.w,

                                   ),
                                 ),
                               );
                             },
                           ),


                        ],
                      );
                    }
                ),
              );
            }
        )
    );
  }
}