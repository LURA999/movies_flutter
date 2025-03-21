import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies ;
  const CardSwiper({required this.movies, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size =  MediaQuery.of(context).size;
    if (this.movies.length == 0) {
        return Container(
          width: double.infinity,
          height: size.height * 0.5,
          child: Center(
            child: CircularProgressIndicator()
          )
        );
    }
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7,
        itemHeight:  size.height * 0.4,
        itemBuilder: ( _ , int index) {

          final movie = movies[index];

          return  GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage( movie.fullPosterImg ),
              fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}