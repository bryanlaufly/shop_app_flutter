import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
import 'package:shop_app_flutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( create:(context) => CartProvider(),

    // return MultiProvider(
    //   providers: [
    //      ChangeNotifierProvider(create:(context) => CartProvider()),
    //   ], // if we have multiple providers

      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        // home: ProductDetailsPage(
        //   product : products[0],
        // ), // use it to test ProductDetailsPage
        home: const HomePage(),
        title: 'Shopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromRGBO(1, 44, 29, 1)),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 20,
            )
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            )
          ),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            prefixIconColor: Color.fromRGBO(111, 111, 111, 1),
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
           )
        ),
      ),
    );
  }
}
