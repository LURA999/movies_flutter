import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'a120005393ddd93d8e0ef36e4fc6e737';
  final String _lenguage = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage =  0;
  MoviesProvider(){
    print('Movies provider inicializado');

    getOnDisplayMovies();
        getPopularMovies();

  }

  getOnDisplayMovies() async {
   final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results ;

    notifyListeners();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url =
        Uri.https(_baseUrl, endpoint, {
          'api_key' : _apiKey,
          'language' : _lenguage,
          'page' : '$page'
          });
        final response = await http.get(url);
        return response.body;
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular',_popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies ,...popularResponse.results] ;
    notifyListeners();
  }
}