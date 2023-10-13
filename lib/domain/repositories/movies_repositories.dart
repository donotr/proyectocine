import 'package:proyecto_cine/domain/entities/movie.dart';

abstract class MoviesRepositories{
// LOS FUTURE SON UNA CLASE QUE DEVUELVE ALGO SINCRONICAMENTE
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});
}