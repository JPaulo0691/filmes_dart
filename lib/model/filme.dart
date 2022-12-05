import 'package:flutter/material.dart';

class Filme extends StatefulWidget {
  int id;
  String imagem;
  String titulo;
  String genero;
  String faixa_etaria;
  String duracao;
  double nota;
  int ano;
  String descricao;

  Filme(this.imagem, this.titulo, this.genero, this.faixa_etaria, this.duracao,
      this.nota, this.ano, this.descricao,
      {required this.id});

  @override
  State<Filme> createState() => _FilmeState();
}

class _FilmeState extends State<Filme> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
