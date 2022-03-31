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
        body: ListaTrasferencias()
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorNumConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Transferência'),
        backgroundColor: const Color.fromARGB(255, 66, 165, 100)
      ),
      body: Column(
        children: [
          Editor(controller: _controladorNumConta, labelText: 'Número da conta', hintText: '1000', icon: null),
          Editor(controller: _controladorValor, labelText: 'Valor', hintText: '100.0', icon: Icons.monetization_on),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 66, 165, 100)
            ),
            onPressed: () {
              _criaTransferencia(context);
            }, 
            child: const Text('Adicionar')
          )
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorNumConta.text);
    final double? valor = double.tryParse(_controladorValor.text);
    
    if( numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData? icon;

  const Editor({required this.controller, required this.labelText, required this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 16.0
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: labelText,
          hintText: hintText
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTrasferencias extends StatefulWidget {

  final List<Transferencia> _transferencias = [];
  
  @override
  State<StatefulWidget> createState() {
    return ListaTrasferenciasState();
  }
}

class ListaTrasferenciasState extends State<ListaTrasferencias>{
  @override
  Widget build(BuildContext context) {
    widget._transferencias.add(Transferencia(200, 20));

    return Scaffold(
      appBar: AppBar(
        title: const Text('ByteBank'),
        backgroundColor: const Color.fromARGB(255, 66, 165, 100),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          return ItemTranferencias(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormularioTransferencia();
          }));

          future.then((transferenciaRecebida){
            debugPrint('$transferenciaRecebida');
            widget._transferencias.add(transferenciaRecebida); 
          });
        },
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

  @override
  String toString(){
    return 'Transferencia($_numeroConta, $_valor)';
  }
}
