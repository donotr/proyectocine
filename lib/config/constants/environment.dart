import 'package:flutter_dotenv/flutter_dotenv.dart';
//aqui se llama la key del pai
class Environment {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
}
