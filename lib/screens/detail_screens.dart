import 'package:flutter/material.dart';
import 'package:movies/widgets/casting_cards.dart';

class DetailScreen extends StatelessWidget {
//  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO cambiar luego por una instancia de movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards()
            ])
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned:  true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only( bottom:  10 ),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle( fontSize:  16),
          )
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final TextTheme textTheme = Theme.of(context).textTheme;


    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          SizedBox( width: 20 ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('moovie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis,maxLines: 2),
              Text('moovie.original.title', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis,maxLines: 2),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 15,color: Colors.amber,),
                  SizedBox(width: 5), 
                  Text('movie.voteAverage', style: textTheme.caption,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 10),
      child:  Text('Id ut nisi commodo est irure qui irure commodo enim. In occaecat do incididunt eiusmod commodo commodo cillum aliqua cillum ad ad. Ullamco veniam veniam cupidatat eiusmod laborum eu ex adipisicing commodo ea ex in. Velit magna eiusmod non enim tempor.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}