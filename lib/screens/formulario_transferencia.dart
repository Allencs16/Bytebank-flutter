import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor =
  TextEditingController();

  final _tituloAppBar = 'Criando transferência';
  final _rotuloCampoValor = 'Valor';
  final _dicaCampoValor = '0.00';
  final _rotuloCampoNumeroConta = 'Número da conta';
  final _dicaCampoNumeroConta = '0000';
  final _textoBotaoConfirmar = 'Confirmar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controladorCampoNumeroConta,
              labelText: _rotuloCampoNumeroConta,
              hintText: _dicaCampoNumeroConta,
            ),
            Editor(
              controller: _controladorCampoValor,
              labelText: _rotuloCampoValor,
              hintText: _dicaCampoValor,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }
  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferência');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}