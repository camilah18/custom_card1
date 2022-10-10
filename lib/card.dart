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
  late bool ;

   CustomCard({
     Key? key,
     required this.name,
     required this.day,
     required this.month,
     required this.year,
     this.price,
     this.imagePath,
     this.imageUrl,
     this.isFavorite,
   }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  _date() {
    return "${widget.day}/${widget.month} - ${widget.year}";
  }

  _isFavorite() {
    setState(() {
      //widget.isFavorite = !widget.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.only(left: 280.0, right: 280.0, top: 180.0, bottom: 180.0),
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //mainAxisSize: MainAxisSize.max,
          children: [
            _image(),
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      //mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(widget.name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,),
                        ),
                        //const SizedBox(height: 35.0,),
                        Text(_date(),
                          style: const TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,),
                        //const SizedBox(height: 35.0,),
                        Text(widget.price != null ? '\u0024${widget.price}' : " ",
                          style: const TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buttonFavorite(),
                        const SizedBox(height: 20,),
                        _buttonShare(),
                        ],
                    ),
                  ],
                ),
                _isButtonVisible(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _image(){
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
    );
  }

  Widget _buttonFavorite() {
    Widget _icon() {
      if (widget.isFavorite) {
        return const Icon(Icons.star, color: Colors.amberAccent,);
      }else{
        return const Icon(Icons.star_border);
      }
    }
    return ElevatedButton(
      onPressed: _isFavorite(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(const CircleBorder(
            side: BorderSide(color: Colors.white,
                width: 1.0,
                style: BorderStyle.solid))),
        elevation: MaterialStateProperty.all(5),
        padding: MaterialStateProperty.all(const EdgeInsets.all(3)),
      ),
      child:_icon(),
    );
  }

  Widget _buttonShare() {
    return ElevatedButton(
      onPressed: (){},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(const CircleBorder(
            side: BorderSide(color: Colors.white,
                width: 1.0,
                style: BorderStyle.solid))),
        elevation: MaterialStateProperty.all(5),
        padding: MaterialStateProperty.all(const EdgeInsets.all(3)),
      ),
      child:const Icon(Icons.share_outlined),
    );
  }

  _isButtonVisible() {
    widget.price != null ? CustomButton(text: "Comprar") : const SizedBox.shrink();
  }
}