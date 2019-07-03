import 'package:flutter/material.dart';
import 'package:flutter_cine/view/filme_em_cartaz/filmes_em_cartaz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter cine',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        secondaryHeaderColor: Colors.black87
      ),
      home: FilmesEmCartazPage(title: 'Flutter cine'),
    );
  }
}
