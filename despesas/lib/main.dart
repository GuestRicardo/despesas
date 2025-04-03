import 'package:despesas/components/transaction_list.dart';
import 'package:flutter/material.dart';
import './model/transaction.dart';
import 'package:flutter/services.dart';
import 'components/transaction_form.dart';

main() => runApp(ExpensesApp());

//este é o widget raiz do aplicativo
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'TESTE', home: MyHomePage());
  }
}

//esta é a tela inicial do aplicativo'
class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
      category: 'Esportes',
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.35,
      date: DateTime.now(),
      category: 'Contas',
    ),
    Transaction(
      id: 't3',
      title: 'Conta de Água',
      value: 100.00,
      date: DateTime.now(),
      category: 'Contas',
    ),
    Transaction(
      id: 't4',
      title: 'Novo Celular',
      value: 1500.00,
      date: DateTime.now(),
      category: 'Tecnologia',
    ),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),

        title: Text(
          'Despesas Pessoais',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            textBaseline: TextBaseline.alphabetic,
            fontFamily: 'OpenSans',
            fontStyle: FontStyle.normal,
            letterSpacing: 1.5,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 3),
            ],
          ),
        ),
      ),

      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      //Despesas Pessoais
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 15,
              child: Text('Gráfico de Despesas'),
            ),
          ),
          //Espaço entre o gráfico e a lista de transações
          TransactionList(_transactions),
          TransactionForm(),
        ],
      ),
    );
  }
}
