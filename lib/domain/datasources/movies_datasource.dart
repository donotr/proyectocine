import 'package:proyecto_cine/domain/entities/movie.dart';
//aqui se definen las en cines, populares, mejor punteadas etc
abstract class MoviesDatasource{

  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});
}