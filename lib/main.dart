import 'package:flutter/material.dart';
import 'package:qtec_shop/pages/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qtec Shop',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(
          primary: Colors.indigo,
          secondary: Colors.pink,
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(247, 242, 255, 1),
      ),
      home: const ProductsPage(),
    );
  }
}
