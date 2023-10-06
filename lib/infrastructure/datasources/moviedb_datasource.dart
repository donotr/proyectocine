import 'package:flutter/material.dart';
import 'package:proyecto_cine/config/constants/environment.dart';
import 'package:proyecto_cine/domain/datasources/movies_datasource.dart';
import 'package:proyecto_cine/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource{

  final dio = Dio(BaseOptions(
  baseUrl: 'https://api.themoviedb.org/3',
  queryParameters:{
    'api_key': Environment.theMovieDbKey,
    'language': 'es-MX',
  }
  ));

  List<Movie> _jsonToMovies (Map<String,dynamic>json){
    final movieDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = MovieDbResponse.results
    .where((moviedb)=>moviedb.posterPath != 'no-poster')
    .map(
      (moviedb)=>MovieMapper.movieDBToEntity(moviedb)
    ).toList();
    
    return movies;
  }


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters:{
        'page': page
      }
      );

      return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async{
    
    final response = await dio.get('/movie/top_rated',
    queryParameters:{
      'page':page
    });
    return _jsonToMovies(response.data);
  }
}