import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './model/transaction.dart';
import 'package:intl/intl.dart';
import Intl

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
  MyHomePage({super.key});
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
          Column(
            children:
                _transactions.map((tr) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            //border: Border.all(color: Colors.purple, width: 2),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            //Interpolando String no valor da transação
                            'R\$ ${tr.value.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              tr.category,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 77, 76, 76),
                              ),
                            ),
                            Text(
                              DateFormat('d MMM y').format(tr.date),
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
