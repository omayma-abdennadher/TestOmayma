import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testflutter/app/modules/home/views/HomeView.dart';
import 'app/modules/detailsProduct/views/DetailsView.dart';
void main() {
  runApp( ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          progressIndicatorTheme: ProgressIndicatorThemeData(),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeView());
  }
}







