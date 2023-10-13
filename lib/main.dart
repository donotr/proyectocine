import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_cine/config/router/app_router.dart';
import 'package:proyecto_cine/config/theme/app_theme.dart';


Future<void> main() async{
  await dotenv.load(fileName:'.env');
//providersccope predefinidio de dart para un menu interno, un entorno especifico
  runApp(const ProviderScope (child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

//provider scope manda a llamar a material app y material app manda a llamar a router, router llama a approuter, y approuter llama las clases
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme:  AppTheme().getTheme(),
    );
  }
}


