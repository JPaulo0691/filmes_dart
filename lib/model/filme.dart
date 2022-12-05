import 'package:flutter/material.dart';
import 'package:catalog_movies/data/database.dart';

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
  bool assetOrNetwork() {
    if (widget.imagem.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.blue),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.imagem,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.imagem,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.titulo,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onLongPress: () {
                            delete(widget.id);
                          },
                          onPressed: () {
                            print(widget.descricao);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
