import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, String) onSubmit;
  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  //controllers
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  final categoryController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    final category = categoryController.text;

    if (title.isEmpty || value <= 0 || category.isEmpty) {
      return;
    }
    widget.onSubmit(title, value, category);
  }

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
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: '  Título',
                labelStyle: TextStyle(color: Colors.purple),
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              //o anderline na função abaixo significa que nao será usada para nada
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: '  Valor (R\$)',
                labelStyle: TextStyle(color: Colors.purple),
              ),
              //teclado numerico
            ),
            TextField(
              controller: categoryController,
              onSubmitted: (_) => _submitForm(),
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
                  onPressed: _submitForm,
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
