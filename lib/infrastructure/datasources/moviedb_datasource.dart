import 'package:dio/dio.dart';
import 'package:proyecto_cine/config/constants/environment.dart';
import 'package:proyecto_cine/domain/datasources/movies_datasource.dart';
import 'package:proyecto_cine/domain/entities/movie.dart';
import 'package:proyecto_cine/infrastructure/mappers/movie_mappers.dart';
import 'package:proyecto_cine/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource{

  final dio = Dio(BaseOptions(
  baseUrl: 'https://api.themoviedb.org/3',
  queryParameters:{
    'api_key': Environment.theMovieDbKey, //api
    'language': 'es-MX', //lenguaje
  }
  ));

  List<Movie> _jsonToMovies (Map<String,dynamic>json){
    final movieDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb)=>moviedb.posterPath != 'no-poster')
    .map(
      (moviedb)=>MovieMapper.movieDBToEntity(moviedb)
    ).toList();
    
    return movies;
  }

//estas direcciones son las especificas propias de la pagina
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters:{
        'page': page
      }
      );
//devuelve un json con la estructura de la clase movies
      return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async{
    
    final response = await dio.get('/movie/top_rated',
    queryParameters:{
      'page':page
    });
    //devuelve un json con la estructura de la clase movies
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async{
    
    final response = await dio.get('/movie/popular',
    queryParameters:{
      'page':page
    });
    //devuelve un json con la estructura de la clase movies
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{
    
    final response = await dio.get('/movie/upcoming',
    queryParameters:{
      'page':page
    });
    //devuelve un json con la estructura de la clase movies
    return _jsonToMovies(response.data);
  }

  
}