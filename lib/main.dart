import 'dart:io';

import 'package:despesas/components/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import './components/transaction_list.dart';
import './components/transaction_form.dart';
import '../../model/transaction.dart';

main() => runApp(ExpensesApp());

//este é o widget raiz do aplicativo
class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    //essa linha é para forçar o aplicativo a rodar apenas em modo retrato
    //isso é útil para aplicativos que não precisam de rotação de tela, como jogos ou calculadoras
    //isso é opcional, mas é uma boa prática para aplicativos que não precisam de rotação de tela
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'OpenSans',
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
      ),
    );
  }
}

//esta é a tela inicial do aplicativo'
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't0',
      title: '#0',
      value: 0.76,
      date: DateTime.now().subtract(Duration(days: 40)),
      category: 'Conta antiga',
    ),
    Transaction(
      id: 't1',
      title: '#01',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 3)),
      category: 'Esportes',
    ),
    Transaction(
      id: 't2',
      title: '#02',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 2)),
      category: 'Alimentação',
    ),
    Transaction(
      id: 't2',
      title: '#02',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 2)),
      category: 'Alimentação',
    ),
    Transaction(
      id: 't2',
      title: '#02',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 2)),
      category: 'Alimentação',
    ),
    Transaction(
      id: 't2',
      title: '#02',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 2)),
      category: 'Alimentação',
    ),
  ];
  //para exibir o gráfico, vamos usar um booleano
  //que vai controlar se o gráfico deve ser exibido ou não
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value, String category, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
      category: category,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop(); // fecha o modal
    //esse navigattor serve tambem , para fazer navegação entre telas, e componentes
    //exemplo, se tem algo q clica no inicio e te leve para algum lugar no fim do app
    //o pop vai tirar o primeiro elemento da pilha de navegação
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool modoPaisagem = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      title: Text(
        'Despesas Pessoais',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30 * mediaQuery.textScaleFactor,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          textBaseline: TextBaseline.alphabetic,
          fontFamily: 'OpenSans-Bold',
          fontStyle: FontStyle.normal,
          letterSpacing: 1.5,
          shadows: [
            Shadow(
              color: const Color.fromARGB(255, 255, 255, 255),
              offset: Offset(2, 2),
              blurRadius: 3,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        if (modoPaisagem)
          IconButton(
            color: Colors.white,
            icon: Icon(_showChart ? Icons.list : Icons.show_chart),
            onPressed: () {
              setState(() {
                _showChart = !_showChart; // Alterna a exibição do gráfico
              });
            },
          ),
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.add),
          onPressed: () {
            _openTransactionFormModal(context);
          },
        ),
      ],
    );

    //altura inicial disponível da tela
    final availableHeight =
        mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final pageBody = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // if (modoPaisagem)
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text(
          //         'Exibir Gráfico',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 20 * MediaQuery.of(context).textScaleFactor,
          //         ),
          //       ),
          //       Switch(
          //         value: _showChart,
          //         onChanged: (value) {
          //           // Lógica para alternar a exibição do gráfico
          //           setState(() {
          //             _showChart = value;
          //           });
          //         },
          //       ),
          //     ],
          //   ),
          // SizedBox(
          //   width: double.infinity,
          //   child: Card(
          //     color: Colors.blue,
          //     elevation: 15,
          //     child: Text('Gráfico de Despesas'),
          //   ),
          // ),
          if (_showChart ||
              !modoPaisagem) // Se o gráfico deve ser exibido ou se não está em modo paisagem)
            SizedBox(
              height: availableHeight * (modoPaisagem ? 0.7 : 0.20),
              child: Chart(_recentTransactions), // 60% da altura disponível
            ),
          //Lista de transações
          if (!_showChart ||
              !modoPaisagem) // Se o gráfico não deve ser exibido ou se está em modo paisagem
            SizedBox(
              height:
                  availableHeight *
                  (modoPaisagem ? 1 : 0.7), // 60% da altura disponível
              //height: 500,
              //width: double.infinity,
              //padding: const EdgeInsets.all(10),
              //margin: const EdgeInsets.all(10),
              child: TransactionList(_transactions, _removeTransaction),
            ),
          //Espaço entre o gráfico e a lista de transações
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
          child: Container(), // Use an empty Container as a placeholder
        )
        : Scaffold(
          appBar: appBar,
          backgroundColor: Color.fromARGB(255, 43, 42, 42),
          //Despesas Pessoais
          body: pageBody,
          floatingActionButton:
              Platform.isIOS
                  ? Container()
                  : FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 0, 109, 182),
                    child: Icon(Icons.add),
                    onPressed: () {
                      _openTransactionFormModal(context);
                    },
                  ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
  }
}
