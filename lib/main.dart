import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:exospace_app/theme/app_theme.dart';
import 'package:exospace_app/screens/screens.dart';
import 'package:exospace_app/services/services.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PictureDayService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExoplanetService(),
        ),
        ChangeNotifierProvider(
          create: (_) => RoverService()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Exospace',
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeScreen(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}