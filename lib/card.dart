import 'package:custom_card/button.dart';
import 'package:flutter/material.dart';
class CustomCard extends StatefulWidget {
  final String name;
  final int day;
  final  int month;
  final int year;
  final double? price;
  final String? imagePath;
  final String? imageUrl;
  late   bool isFavorite;

   CustomCard({Key? key, required this.name, required this.day, required this.month, required this.year, this.price, this.imagePath, this.imageUrl, this.isFavorite = false}) : super(key: key);


  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  _date() {
    return "${widget.day}/${widget.month} - ${widget.year}";
  }

  void isFavorite() {
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.only(left: 280.0, right: 280.0, top: 180.0, bottom: 180.0),
      elevation: 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(90.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), color: Colors.red),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(

                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(widget.name, style: const TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.bold,),),
                      const SizedBox(height: 35.0,),
                      Text(_date(), style: const TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.left,),
                      const SizedBox(height: 35.0,),
                      Text(widget.price != null ? '\u0024$widget.price' : "",
                        style: const TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold,),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.white),
                            shape: MaterialStateProperty.all(
                                const CircleBorder(side: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                    style: BorderStyle.solid))),
                            elevation: MaterialStateProperty.all(5),
                            padding: MaterialStateProperty.all(const EdgeInsets
                                .all(3)),
                          ),
                          child:
                          const IconButton(
                              onPressed: null,
                              icon: Icon(Icons.star)
                          )
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.white),
                            shape: MaterialStateProperty.all(
                                const CircleBorder(side: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                    style: BorderStyle.solid))),
                            elevation: MaterialStateProperty.all(5),
                            padding: MaterialStateProperty.all(const EdgeInsets
                                .all(3)),
                          ),
                          onPressed: null,
                          child: const Icon(Icons.share, color: Colors.grey,))
                      //IconButton(onPressed: null, icon: Icon(Icons.star)),
                      //IconButton(onPressed: null, icon: Icon(Icons.share)),
                    ],
                  ),
                ],
              ),


            ],
          ),
        ],
      ),

    );
  }

  _isButtonVisible() {
    widget.price != null ? CustomButton(text: "Comprar") : const SizedBox
        .shrink();
  }
  _buttonFavorite() {
    Icon icon;
    return ElevatedButton(onPressed: ,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(const CircleBorder(
            side: BorderSide(color: Colors.white,
                width: 1.0,
                style: BorderStyle.solid))),
        elevation: MaterialStateProperty.all(5),
        padding: MaterialStateProperty.all(const EdgeInsets.all(3)),
      ),
      child:
      const IconButton(
          onPressed: this.isFavorite(),
          icon: Icon(Icons.star) 
      ),
    );
  }
}
      );

  }


