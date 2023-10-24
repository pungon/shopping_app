import 'package:flutter/material.dart';
import 'package:shoping/screen/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoping/colors/color.dart';

import 'package:provider/provider.dart';
import 'package:shoping/models/modelProvider.dart';

void main() {
  // runApp(
  //   const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shopping_cart()),
        ChangeNotifierProvider(create: (context) => MyModel()),
      ],
      child: MyApp(),
    ),
  ); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: AppColors.greenC,
        ),
        cardTheme: const CardTheme().copyWith(
          
          margin: const EdgeInsets.all(10
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: GoogleFonts.robotoCondensed(
            fontSize: 17,
          ),
          titleMedium: GoogleFonts.robotoCondensed(
            fontSize: 14,
          ),
          titleSmall: GoogleFonts.robotoCondensed(
            fontSize: 12,
          ),
        ),

      ),
      // home: ChangeNotifierProvider(
      //   create: (context) => Shopping_cart(),
      //   child: Home()),

      home: Home(),
    );
  }
}
