import 'package:flutter/material.dart';
import '../../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child:
          transactions.isEmpty
              ? Column(
                children: <Widget>[
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: // Theme.of(context).textTheme.titleLarge,
                        const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
              : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tr = transactions[index];
                  //return Card(
                  //  child: Text(tr.title),
                  //);
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
                                color: Color.fromARGB(255, 26, 26, 26),
                              ),
                            ),
                            Text(
                              DateFormat('dd/MM/yyy').format(tr.date),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 56, 56, 56),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
