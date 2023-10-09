import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_cine/infrastructure/datasources/moviedb_datasource.dart';
import 'package:proyecto_cine/infrastructure/repositories/movie_repository_impl.dart';


//este repositorio es inmutable
final movieRepositoryProvider = Provider((red){
  return MovieRepositoryImpl(MoviedbDatasource());
});