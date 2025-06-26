import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
          builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                SizedBox(height: constraints.maxHeight * 0.05),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                  child: Text(
                    'Nenhuma Transação Cadastrada!',
                    textAlign: TextAlign.center,
                    style: // Theme.of(context).textTheme.titleLarge,
                        TextStyle(
                      fontSize: 30 * MediaQuery.of(context).textScaleFactor,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
        )
        : ListView.builder(
          itemCount: transactions.length,
          //item responsavel por construir cada item da lista
          itemBuilder: (context, index) {
            final tr = transactions[index];
            //return Card(
            //  child: Text(tr.title),
            //);
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text(
                      'R\$ ${tr.value.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                tr.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(2, 2),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                DateFormat('dd/MM/yyy').format(tr.date),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 255, 255, 255),
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(2, 2),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () {
                  onRemove(tr.id);
                  //print('Deletar');
                  //print(tr.id);
                },
              ),
            );
            //  Card(
            //   child: Row(
            //     children: <Widget>[
            //       Container(
            //         margin: const EdgeInsets.symmetric(
            //           vertical: 10,
            //           horizontal: 15,
            //         ),
            //         decoration: BoxDecoration(
            //           //border: Border.all(color: Colors.purple, width: 2),
            //         ),
            //         padding: const EdgeInsets.all(10),
            //         child: Text(
            //           //Interpolando String no valor da transação
            //           'R\$ ${tr.value.toStringAsFixed(2)}',
            //           style: const TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.purple,
            //           ),
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             tr.title,
            //             style: const TextStyle(
            //               fontSize: 18,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           Text(
            //             tr.category,
            //             style: const TextStyle(
            //               color: Color.fromARGB(255, 26, 26, 26),
            //             ),
            //           ),
            //           Text(
            //             DateFormat('dd/MM/yyy').format(tr.date),
            //             style: const TextStyle(
            //               color: Color.fromARGB(255, 56, 56, 56),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // );
          },
        );
  }
}
