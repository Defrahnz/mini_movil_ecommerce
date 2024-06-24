import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(MyStoreApp());
}

class MyStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Joyas y un poco mas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(),
      ),
    );
  }
}
