import 'package:flutter/material.dart';
import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'transaction_list.dart';
import '../../model/transaction.dart';
import './transaction_form.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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

  _addTransaction(String title, double value, String category) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
      category: 'Categoria',
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
