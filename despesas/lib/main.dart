import 'package:flutter/material.dart';
import 'package:despesas/model/transaction.dart';

main() => runApp(ExpensesApp());

//este é o widget raiz do aplicativo
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despesas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

//esta é a tela inicial do aplicativo'
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<String> transactions = [
    'Transação 1',
    'Transação 2',
    'Transação 3',
    'Transação 4',
    'Transação 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Gráfico de Despesas'),
            ),
          ),
          Card(elevation: 5, child: Text('Lista de Transações')),
        ],
      ),
    );
  }
}
