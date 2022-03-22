// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia()
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Transferência'),
        backgroundColor: const Color.fromARGB(255, 66, 165, 100)
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          TextField(),
          ElevatedButton(
            onPressed: () => Printar('mensagem'), 
            child: const Text('Adicionar')
          )
        ],
      ),
    );
  }
}

class ListaTrasferencias extends StatelessWidget {

  @override 
  Widget build(BuildContext context){

    return Scaffold(
      // ignore: prefer_const_literals_to_create_immutables
      appBar: AppBar(
        title: const Text('ByteBank'),
        backgroundColor: const Color.fromARGB(255, 66, 165, 100),
      ),
      body: 
        ItemTranferencias(Transferencia(100.0, 1000)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Printar('mensagem'),
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 66, 165, 100),
      ),
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
