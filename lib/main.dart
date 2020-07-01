import 'package:amiibo/models/amiibo.dart';
import 'package:amiibo/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AmiiboList>(create: (context) {
      AmiiboList amiibo = AmiiboList();
      amiibo.loadAll();
      return (amiibo);
    }, builder: (context, child) {
      return MaterialApp(
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
        },
        home: HomeScreen(),
      );
    });
  }
}
