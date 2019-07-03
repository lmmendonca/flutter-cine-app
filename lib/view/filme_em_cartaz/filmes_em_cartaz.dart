import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cine/shared/constraint.dart';
import 'package:flutter_cine/shared/repository/filmeRepository.dart';
import 'package:flutter_cine/view/filme/filme.dart';

class FilmesEmCartazPage extends StatefulWidget {
  FilmesEmCartazPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FilmesEmCartazPageState createState() => _FilmesEmCartazPageState();
}

class _FilmesEmCartazPageState extends State<FilmesEmCartazPage> {
  TextStyle titulo = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  Widget quantidadeEstrelasFilme(Filme filme) {
    double quantidadeEstrelas = filme.voteAverage / 2;
    const double tamEstrela = 25;

    return Row(
      children: <Widget>[
        Icon(
          quantidadeEstrelas > 1
              ? Icons.star
              : quantidadeEstrelas > 0.5 ? Icons.star_half : Icons.star_border,
          color: Colors.yellowAccent,
          size: tamEstrela,
        ),
        Icon(
          quantidadeEstrelas > 2
              ? Icons.star
              : quantidadeEstrelas > 1.5 ? Icons.star_half : Icons.star_border,
          color: Colors.yellowAccent,
          size: tamEstrela,
        ),
        Icon(
          quantidadeEstrelas > 3
              ? Icons.star
              : quantidadeEstrelas > 2.5 ? Icons.star_half : Icons.star_border,
          color: Colors.yellowAccent,
          size: tamEstrela,
        ),
        Icon(
          quantidadeEstrelas > 4
              ? Icons.star
              : quantidadeEstrelas > 3.5 ? Icons.star_half : Icons.star_border,
          color: Colors.yellowAccent,
          size: tamEstrela,
        ),
        Icon(
          quantidadeEstrelas > 5
              ? Icons.star
              : quantidadeEstrelas > 4.5 ? Icons.star_half : Icons.star_border,
          color: Colors.yellowAccent,
          size: tamEstrela,
        ),
      ],
    );
  }

  Widget filmeEmCartaz(Filme filme) {
    return Container(
      height: 120,
      child: Card(
        child: ListTile(
          leading: Container(
            child: Image.network(URL_POSTER + filme.posterPath),
          ),
          title: Text(filme.title, style: titulo),
          subtitle: Column(
            children: <Widget>[
              quantidadeEstrelasFilme(filme),
              (filme.overview.length >= 80)
                  ? Text(filme.overview.substring(0, 80) + ' ...')
                  : Text(filme.overview)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: FutureBuilder<List<Filme>>(
        future: fetchFilmes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Filme> filme = snapshot.data;

            return ListView.builder(
              itemCount: filme.length,
              itemBuilder: (BuildContext context, int index) {
                return filmeEmCartaz(filme[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // Animação loading
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
