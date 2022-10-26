import 'package:custom_card/custom_card.dart';
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
  BingoModel bingo1 = BingoModel(1, "29° Bingo de la Liga Salteña de Futbol", DateTime(2022, 12, 7), "https://i0.wp.com/infosal.es/wp-content/uploads/2020/03/BINGO.jpg?fit=2000%2C2000&ssl=1",5000);
  BingoModel bingo2 = BingoModel(2, "40° Bingo de la Liga Salteña de Voley", DateTime(2022, 12, 7), "", 0);
  BingoModel bingo3 = BingoModel(3, "55° Bingo de la Liga Salteña de Basquet", DateTime(2022, 12, 7), "", 5000);

  @override
  Widget build(BuildContext context) {
    void shopp(BingoModel model){
      print("Comprar ${model.getName()}");
    }

    void share(BingoModel model){
      print("Compartir ${model.getName()}");
    }

    void favorite(BingoModel model){
      if(model.getIsFavorite()){
        print("Añadido a favoritos ${model.getName()}");
      }else{
        print("Quitado de favoritos ${model.getName()}");
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:ListView(
          children: [
            CustomCard(
              bingo: bingo1,
              shoppIt: shopp,
              stateFavorite:favorite,
              shareIt:share,
            ),
            const SizedBox(height:30),
            CustomCard(
                bingo: bingo2,
                shoppIt: shopp,
                stateFavorite:favorite,
                shareIt:share,
            ),
            const SizedBox(height:30),
            CustomCard(
              bingo: bingo3,
              shoppIt: shopp,
              stateFavorite:favorite,
              shareIt:share,
            ),
          ],
        ),
      ),
    );
  }
}
