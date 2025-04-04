import 'package:flutter/material.dart';
import 'package:despesas/components/transaction_user.dart';

main() => runApp(ExpensesApp());

//este é o widget raiz do aplicativo
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

//esta é a tela inicial do aplicativo'
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
          TransactionUser(),
        ],
      ),
    );
  }
}
