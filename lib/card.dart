import 'package:flutter/material.dart';

import 'button.dart';


class CustomCard extends StatefulWidget {
  final String name;
  final int day;
  final  int month;
  final int year;
  final int? price;
  final String? imagePath;
  final String? imageUrl;
  late bool isFavorite;

  CustomCard({
    Key? key,
    required this.name,
    required this.day,
    required this.month,
    required this.year,
    this.price,
    this.imagePath,
    this.imageUrl,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  String _dateFormat(){
    return "${widget.day}/${widget.month} - ${widget.year}";
  }

  void isFavorite()
  {
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _card(300);
  }

  Widget _card(double width){
    return Material(
      elevation: 10,
      color: Colors.transparent,
      child: Container(
          width: width,
          height: width*0.55,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: EdgeInsets.all(width*0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container( width: width*0.40, height: width*0.40, color: Colors.transparent,
                  child: _cardImage(width*0.35),
                ),
                SizedBox(width: width*0.05,),
                SizedBox(
                    width: width*0.65, height: width*0.45,
                    child: Column(
                      children: [
                        Row(children: [
                          SizedBox(width: width*0.5, height: width*0.25,child: _dataCard(width),),
                          SizedBox(width: width*0.05,),
                          SizedBox(width: width*0.1, height: width*0.25, child: _buttons(width),)
                        ],),
                        SizedBox(height: width*0.05,),
                        SizedBox(width: width*0.65, height: width*0.15, child: _isButtonVisible(width)),
                      ],
                    )
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget _cardImage(double width){
    _childImage(){
      if (widget.imagePath != null){
        return Image.asset(widget.imagePath!, fit: BoxFit.fill);
      } else if(widget.imageUrl != null){
        return Image.network(widget.imageUrl!, fit: BoxFit.fill,);
      } else{
        return Icon(Icons.image_not_supported_outlined, size: width*0.5);
      }
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: _childImage(),);
  }

  Widget _dataCard(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(fontSize: width * 0.045,
              fontWeight: FontWeight.bold,
              color: Colors.black),),
        Text(_dateFormat(),
          style: TextStyle(fontSize: width * 0.045, color: Colors.black),),
        const SizedBox(height: 5,),
        Text(widget.price != null ? '\u0024${widget.price}' : "",
            style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.bold,color: Colors.black)),
      ],
    );
  }

  Widget _buttons(double width){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buttonFavorite(),
        SizedBox(height: width*0.02,),
        _buttonShare(),
      ],
    );
  }

  Widget _buttonFavorite() {
    Widget _icon() {
      if (widget.isFavorite) {
        return const Icon(Icons.star, color: Colors.amber,size: 25,);
      }else{
        return const Icon(Icons.star_border, color: Colors.grey, size: 25);
      }
    }
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
          onTap: (){
            isFavorite();
            if(widget.isFavorite){
              print("Añadido ${widget.name} a favoritos");
            }else{
              print("Quitado ${widget.name} de favoritos");
            }
          },
          borderRadius:BorderRadius.circular(32) ,
          child: SizedBox(
            width: 32,
            height: 32,
            child: _icon(),
          )
      ),
    );
  }

  Widget _buttonShare() {
    return Material(
      elevation: 3,
      borderRadius:BorderRadius.circular(32) ,
      child: InkWell(
          onTap: (){
            print("Compartir ${widget.name}");
          },
          borderRadius:BorderRadius.circular(32) ,
          child: const SizedBox(
            width: 32,
            height: 32,
            child: Icon(Icons.share_outlined,color: Colors.grey,size: 21,),
          )
      ),
    );
  }

  Widget _isButtonVisible(double width) {
    return widget.price != null ? Padding(
      padding: const EdgeInsets.only(bottom:15),
      child:
      CustomButton(
        onTap: (){
          print("Comprar ${widget.name}");
        },
        text: "Comprar",
        backgroundColor: const Color(0xff0000b2), fontSize: width * 0.045,),
    ) : const SizedBox.shrink();
  }
}
