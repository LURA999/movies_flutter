import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon( Icons.search_outlined ))
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
         children:  [
          //Tarjetas principales
          CardSwiper( movies: moviesProvider.onDisplayMovies ),

          //Slider de peliculas
          MovieSlider(
            movies: moviesProvider.popularMovies,
            title: 'Populares'
          )

         ],
        ),
      )
    );
  }
}