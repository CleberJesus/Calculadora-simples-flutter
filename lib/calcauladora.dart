import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'memory.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final _memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          _buildDisplay(),
          const Divider(
            height: 0.1,
          ),
          _builKeyboard(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: AutoSizeText(
                _memory.result,
                minFontSize: 20.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 80.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builKeyboardButton(
    String label, {
    int flex = 1,
    Color textColor = Colors.white,
  }) {
    return Expanded(
        flex: flex,
        child: TextButton(
          child: Text(
            label,
            style: const TextStyle(fontSize: 24.0),
          ),
          onPressed: () {
            setState(() {
              _memory.applyCommand(label);
            });
          },
        ));
  }

  Widget _builKeyboard() {
    return Container(
      color: Colors.black,
      height: 400.0,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _builKeyboardButton('AC', textColor: Colors.orange),
                _builKeyboardButton('DEL', textColor: Colors.orange),
                _builKeyboardButton('%', textColor: Colors.orange),
                _builKeyboardButton('/', textColor: Colors.orange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              _builKeyboardButton('7'),
              _builKeyboardButton('8'),
              _builKeyboardButton('9'),
              _builKeyboardButton('x', textColor: Colors.orange),
            ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _builKeyboardButton('4'),
                _builKeyboardButton('5'),
                _builKeyboardButton('6'),
                _builKeyboardButton('+', textColor: Colors.orange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _builKeyboardButton('1'),
                _builKeyboardButton('2'),
                _builKeyboardButton('3'),
                _builKeyboardButton('-', textColor: Colors.orange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _builKeyboardButton('0', flex: 2),
                _builKeyboardButton('.'),
                _builKeyboardButton('=', textColor: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
