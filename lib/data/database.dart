import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/filme.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(),
      'filmes.db'); //data/data/pacote/databases/filmes.db
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE filmes('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'imagem TEXT, '
          'titulo TEXT, '
          'genero TEXT, '
          'faixa_etaria TEXT, '
          'duracao TEXT, '
          'nota REAL, '
          'ano INTEGER, '
          'descricao TEXT)');
    },
    version: 1,
  );
}

Future<int> insert(Filme filme) async {
  final Database db = await getDatabase();
  Map<String, dynamic> values = Map();
  values['imagem'] = filme.imagem;
  values['titulo'] = filme.titulo;
  values['genero'] = filme.genero;
  values['faixa_etaria'] = filme.faixa_etaria;
  values['duracao'] = filme.duracao;
  values['nota'] = filme.nota;
  values['ano'] = filme.ano;
  values['descricao'] = filme.descricao;

  print('salvando.......... $values');

  return db.insert('filmes', values);
}

Future<List<Filme>> findAll() async {
  final Database database = await getDatabase();
  List<Map<String, dynamic>> mapFilmes = await database.query('filmes');
  print('Procurando dados...............encontrado: $mapFilmes');
  List<Filme> filmes = [];
  for (var map in mapFilmes) {
    Filme f = Filme(
        map['imagem'].toString(),
        map['titulo'].toString(),
        map['genero'].toString(),
        map['faixa_etaria'].toString(),
        map['duracao'].toString(),
        map['nota'] as double,
        map['ano'] as int,
        map['descricao'].toString(),
        id: map['id']);
    filmes.add(f);
  }

  return filmes;
}

Future<int> update(Filme filme) async {
  Database db = await getDatabase();
  Map<String, dynamic> values = Map();
  values['imagem'] = filme.imagem;
  values['titulo'] = filme.titulo;
  values['genero'] = filme.genero;
  values['faixa_etaria'] = filme.faixa_etaria;
  values['duracao'] = filme.duracao;
  values['nota'] = filme.nota;
  values['ano'] = filme.ano;
  values['descricao'] = filme.descricao;

  return db.update('filmes', values, where: "id = ?", whereArgs: [filme.id]);
}

Future<int> delete(int id) async {
  Database db = await getDatabase();

  return db.delete('filmes', where: "id = ?", whereArgs: [id]);
}
