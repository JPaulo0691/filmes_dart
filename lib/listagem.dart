import 'package:catalog_movies/cadastro.dart';
import 'package:catalog_movies/data/database.dart';
import 'package:catalog_movies/model/filme.dart';
import 'package:flutter/material.dart';

main() {
  runApp(Listagem());
}

class Listagem extends StatefulWidget {
  const Listagem({super.key});

  @override
  State<Listagem> createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("Equipe:"),
              contentPadding: const EdgeInsets.all(20.0),
              content: const Text(
                  "Emanuelle Maria, \n\nJoão Paulo e\n\nRafael Soares"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Filmes"),
        actions: [
          IconButton(
            onPressed: () {
              _showDialog();
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Filme>>(
            future: findAll(),
            builder: ((context, snapshot) {
              List<Filme>? listMovies = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando....")
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando....")
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando....")
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && listMovies != null) {
                    if (listMovies.isNotEmpty) {
                      return ListView.builder(
                          itemCount: listMovies.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Filme film = listMovies[index];
                            return film;
                          });
                    }
                    return Center(
                      child: Column(children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          "Não há nenhum Filme",
                          style: TextStyle(fontSize: 32),
                        )
                      ]),
                    );
                  }
                  return Text("Erro ao carregar Filmes........");
                  break;
              }
              return Text("Erro desconhecido");
            })),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Cadastro();
            }),
          );
        },
      ),
    ));
  }
}
