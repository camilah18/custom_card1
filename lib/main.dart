import 'package:custom_card/card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            CustomCard(
              name: "29° Bingo de la Liga Salteña de Futbol",
              day: 07,
              month: 12,
              year: 2222,
              price: 3000,
              imageUrl: "https://us.123rf.com/450wm/artrich/artrich2108/artrich210800032/173445168-plantilla-de-billete-de-loter%C3%ADa-bingo-o-loter%C3%ADa-fondo-para-juegos-de-azar-deportivos-vectorial-ilust.jpg?ver=6",
            ),
            CustomCard(
              name: "29° Bingo de la Liga Salteña de Futbol",
              day: 07,
              month: 12,
              year: 2222,
              price: 3000,
              ),
            CustomCard(
              name: "29° Bingo de la Liga Salteña de Futbol",
              day: 07,
              month: 12,
              year: 2222,
            ),
            CustomCard(
              name: "29° Bingo de la Liga",
              day: 07,
              month: 12,
              year: 2222,

            ),
            CustomCard(
              name: "29° Bingo de la Liga Salteña de Futbol",
              day: 07,
              month: 12,
              year: 2222,
              price: 3000,
              imageUrl: "https://img.freepik.com/vector-gratis/numeros-tablero-bingo-colorido-historia-instagram_23-2149120357.jpg?w=2000",
            ),
          ],
        ),
      )
    );
  }
}
