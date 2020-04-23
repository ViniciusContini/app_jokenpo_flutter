import 'package:flutter/material.dart';

import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");

  var _resultado = "";
  var _corResultado = true;

  void _opcaoSelecionada(String escolhaUsuario){
    var _opcoes = ["pedra", "papel", "tesoura"];
    var _numeroSorteado = Random().nextInt( 3 );
    var _escolhaApp = _opcoes[_numeroSorteado];

    setState(() {
      _imagemApp = AssetImage("images/$_escolhaApp.png");  
    });

    if(
      (escolhaUsuario == "pedra" && _escolhaApp == "tesoura") || 
      (escolhaUsuario == "papel" && _escolhaApp == "pedra") || 
      (escolhaUsuario == "tesoura" && _escolhaApp == "papel")
      ){
        setState(() {
          _resultado = "Ganhou!!!";
          _corResultado = true;
        });
    } else if (
      (_escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (_escolhaApp == "papel" && escolhaUsuario == "pedra") ||
      (_escolhaApp == "tesoura" && escolhaUsuario == "papel") 
    ) {
      setState(() {
        _resultado = "Perdeu";
        _corResultado = false;
      });
    } else {
      setState(() {
        _resultado = "Empatamos";
        _corResultado = false;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo")
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 6),
            child: Text(
              _resultado,
              style: TextStyle(
                color: (_corResultado ? Colors.green : Colors.red),
                fontSize: 42,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              "Escolha do app:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
          Image(image: this._imagemApp, ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("pedra"),
                child: 
                  Image.asset(
                    "images/pedra.png",
                    height: 100  
                  ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: 
                  Image.asset(
                    "images/papel.png",
                    height: 100
                  )
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: 
                Image.asset(
                  "images/tesoura.png",
                  height: 100
                )
              ),
            ]
          )
        ],
      ),
    );
  }
}