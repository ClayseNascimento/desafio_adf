import 'package:desafio_adf/components/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Desafio ADF'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
              width: 136,
              child: Button(
                textButton: 'Tap Me',
                onPressed: () => functionOnPressed(),
              )),
        ),
      ),
    );
  }

  functionOnPressed() {
    final snackBar = SnackBar(
      content: const Text('ADF é a melhor comunidade de Flutter do Brasil!'),
      backgroundColor: Colors.purple[300],
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
