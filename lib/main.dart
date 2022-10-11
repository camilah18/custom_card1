import 'package:flutter/material.dart';
import 'card.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: const EdgeInsets.all(20),
            scrollDirection: Axis.vertical,
            children: [
              const Divider(),
              CustomCard(name: "29° Bingo de la Liga Salteña de Fútbol", day: 17, month:7, year: 2022,price: 1000,
                imageUrl: 'https://th.bing.com/th/id/R.ac355af87ab6fbb3f85304bdacf7f855?rik=Yc0SncHQgS7QJg&pid=ImgRaw&r=0',),
              const Divider(),
              CustomCard(name: "Bingo San José Campo de Fútbol", day: 12, month:08, year: 2022),
              const Divider(),
              CustomCard(name: "Bingo Remodelación Parroquial", day: 04, month:08, year: 2022,price: 1200,
                imageUrl: 'https://th.bing.com/th/id/OIP.wA4pf72TXyqcCr6rmgqC3AHaHa?pid=ImgDet&rs=1',),
              const Divider(),
            ],),
        ),
      ),
    );
  }
}
