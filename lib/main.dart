// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('ByteBank'),
        backgroundColor: const Color.fromARGB(255, 66, 165, 100),
      ),
      body: ListaTrasferencias(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Printar('mensagem'),
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 66, 165, 100),
      ),
    ),
  ));
}

class ListaTrasferencias extends StatelessWidget {

  @override 
  Widget build(BuildContext context){

    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        ItemTranferencias(Transferencia(100.0, 1000)),
        ItemTranferencias(Transferencia(250.0, 1234))
      ],
    );
  }
} 
 
class ItemTranferencias extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTranferencias(this._transferencia);

  @override
  Widget build(BuildContext context){

    return 
      Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(this._transferencia._valor.toString()),
          subtitle: Text(this._transferencia._numeroConta.toString()),
        ),
      );
  }
}

class Transferencia {
  final double _valor;
  final int _numeroConta;

  Transferencia(this._valor, this._numeroConta);
}

class Printar {
  final String mensagem;

  Printar(this.mensagem);
}
