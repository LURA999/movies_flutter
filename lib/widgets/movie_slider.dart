import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';


class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSlider({super.key, required this.movies,  this.title});
  
  @override
  Widget build(BuildContext context) {
    if (this.movies.length == 0) {
        return Container(
          width: double.infinity,
          height: 260,
          child: Center(
            child: CircularProgressIndicator()
          )
        );
    }

    return Container(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO: Si no hay titulo, no debe de mostrar este widget
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(title ?? '', style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          )
          ,
           const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection:Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: ( _, int index) {
                if (index == movies.length) {
                  return SizedBox(height: 16); // Espacio en blanco
                }
              return _MoviePoster( movies[index]);
              }
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  //TODO:
  final Movie movie;

  const _MoviePoster( this.movie );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children:  [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder:const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height:  5),
           Text(movie.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center
          )
        ],
      ),
    );
  }
}