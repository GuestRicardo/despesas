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
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final categoryController = TextEditingController();
  final DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    final category = categoryController.text;

    if (title.isEmpty || value <= 0 || category.isEmpty) {
      return;
    }
    widget.onSubmit(title, value, category);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      //essa função é chamada quando o usuário seleciona uma data(no futuro)
      if (pickedDate == null) {
        return;
      }
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: '  Título',
                labelStyle: TextStyle(color: Colors.purple),
              ),
            ),
            TextField(
              controller: _valueController,
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
            SizedBox(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('Nenhuma data selecionada!'),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      'Selecionar Data.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //butão add
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  //botão Nova Transação
                  onPressed: _submitForm,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        textBaseline: TextBaseline.alphabetic,
                        fontFamily: 'OpenSans-Bold',
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.5,
                        shadows: [
                          Shadow(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
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
