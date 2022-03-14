// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('ByteBank'),
        backgroundColor: const Color.fromARGB(255, 66, 165, 100),
      ),
      body: Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('100'),
          subtitle: Text('100'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Hello'),
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 66, 165, 100),
      ),
    ),
  ));
}
