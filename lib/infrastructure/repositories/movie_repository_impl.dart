import 'package:proyecto_cine/domain/datasources/movies_datasource.dart';
import 'package:proyecto_cine/domain/entities/movie.dart';
import 'package:proyecto_cine/domain/repositories/movies_repositories.dart';

class MovieRepositoryImpl extends MoviesRepositories{

  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying ({int page = 1}){
    return datasource.getNowPlaying(page:page);
  }
  
  @override
  Future<List<Movie>> getPopular ({int page = 1}){
    return datasource.getPopular(page:page);
  }
  
  @override
  Future<List<Movie>> getTopRated ({int page = 1}){
    return datasource.getTopRated(page:page);
  }
  
  @override
  Future<List<Movie>> getUpcoming ({int page = 1}){
    return datasource.getUpcoming(page:page);
  }
}