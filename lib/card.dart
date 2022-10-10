import 'package:flutter/material.dart';
import 'package:custom_card/button.dart';

class CustomCard extends StatefulWidget {
  final String name;
  final int day;
  final int month;
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
     this.imagePath ,
     this.imageUrl,
     this.isFavorite = false,
   }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  //late bool isFavorite=false;

  _date() {
    String day;
    String month;
    if (widget.day.toString().length < 2){
      day = "0${widget.day}";
    }
    else{
      day = widget.day.toString();
    }
    if (widget.month.toString().length < 2){
      month = "0${widget.month}";
    }
    else{
      month = widget.month.toString();
    }
    return "$day/$month - ${widget.year}";
  }

  void isFavorite() {
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          Container(
            //color: Colors.pink,
            height: 155,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _dataCard(),
                    _buttons(),
                  ],
                ),
                _isButtonVisible(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _image(){
    _childImage(){
      if(widget.imagePath != null){
        return Image.asset(widget.imagePath!,width: 125,height: 125,);
      }
      else if(widget.imageUrl != null){
        return Image.network(widget.imageUrl!,width: 125,height: 125);
      }
      else{
        return Container(
          width: 125,
          height: 125,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const[
              Icon(Icons.image_not_supported_outlined,size: 50,),
              Center(child: Text("No hay imagen disponible",style: TextStyle(color: Colors.grey,fontSize: 13)))
            ],
          ),
        );
      }
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: _childImage()
      )
    );
  }
  
  Widget _dataCard(){
    return Container(
      width: 125,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          ),
          //const SizedBox(height: 35.0,),
          const SizedBox(height: 5,),
          Text(_date(),
            style: const TextStyle(
              fontSize: 17.0,
              //fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
            textAlign: TextAlign.left,),
          //const SizedBox(height: 35.0,),
          const SizedBox(height: 5,),
          Text(widget.price != null ? '\u0024${widget.price}' : " ",
            style: const TextStyle(color: Color(0xff0000b2),
              fontSize: 17.0, fontWeight: FontWeight.bold,),),
        ],
      ),
    );
  }

  Widget _buttons(){
    return Padding(
      padding: const EdgeInsets.only(top:16,right: 15,left: 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buttonFavorite(),
          SizedBox(height: 10,),
          _buttonShare(),
        ],
      ),
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
              print("Quitado ${widget.name} a favoritos");
            }
          },
          borderRadius:BorderRadius.circular(32) ,
        child:Container(
          //padding: EdgeInsets.all(1),
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
          child:Container(
            width: 32,
            height: 32,
            child: const Icon(Icons.share_outlined,color: Colors.grey,size: 21,),
          )
      ),
    );
  }

  Widget _isButtonVisible() {
    return widget.price != null ? Padding(
      padding: const EdgeInsets.only(bottom:15),
      child:
      CustomButton(
        onTap: (){
          print("Comprar ${widget.name}");
        },
        text: "Comprar",
        backgroundColor: const Color(0xff0000b2), height: 30,),
    ) : const SizedBox.shrink();
  }
}