import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatelessWidget {
  //comntrollers
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final categoryController = TextEditingController();

  final void Function(String, double, String) onSubmit;
  TransactionForm(this.onSubmit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: '  Título',
                labelStyle: TextStyle(color: Colors.purple),
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: '  Valor (R\$)',
                labelStyle: TextStyle(color: Colors.purple),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: '  Categoria',
                labelStyle: TextStyle(color: Colors.purple),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;
                    final category = categoryController.text;
                    onSubmit(title, value, category);
                  },
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
