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

  BingoModel bingo1 = BingoModel("29° Bingo de la Liga Salteña de Futbol", "07 / 12 - 2022", "", 3000);
  BingoModel bingo2 = BingoModel("29° Bingo de la Liga Salteña de Futbol", "07 / 12 - 2022", "", 0);
  BingoModel bingo3 = BingoModel("29° Bingo de la Liga Salteña de Futbol", "07 / 12 - 2022", "", 3000);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [ CustomCard(bingo: bingo1), CustomCard(bingo: bingo2), CustomCard(bingo: bingo3)],
        ),
      ),
    );
  }
}
