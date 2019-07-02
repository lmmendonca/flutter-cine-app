import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter cine',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: FilmesEmCartazPage(title: 'Flutter cine'),
    );
  }
}

class FilmesEmCartazPage extends StatefulWidget {
  FilmesEmCartazPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FilmesEmCartazPageState createState() => _FilmesEmCartazPageState();
}

class _FilmesEmCartazPageState extends State<FilmesEmCartazPage> {

  Widget filmeEmCartaz(filme) {
    return Card(
      child: ListTile(
        title: Text('Title Movie'),
        leading: Icon(Icons.ac_unit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            filmeEmCartaz()
          ],
        ),
      ),
    );
  }
}
