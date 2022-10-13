import 'package:flutter/material.dart';
import 'package:custom_card/button.dart';
import 'package:intl/intl.dart';

class BingoModel{
  int? _id;
  String? _name;
  DateTime? _date;
  String? _imageUrl;
  double? _price;
  bool? _isFavorite;

  BingoModel(int? id, String? name, DateTime? date, String? imageUrl, double? price){
    _id = id;
    _name = name;
    _date = date;
    _imageUrl = imageUrl;
    _price = price;
    _isFavorite = false;
  }

  int get gedId => _id!;
  set setId (int id){
    _id = id;
  }

  String get getName => _name!;
  set setName (String name){
    _name = name;
  }

  DateTime get getDate => _date!;
  set setDate (DateTime date){
    _date = date;
  }

  String get getImageUrl => _imageUrl!;
  set setImageUrl (String imageUrl){
    _imageUrl = imageUrl;
  }

  double get getPrice => _price!;
  set setPrice (double price){
    _price = price;
  }

  bool get getIsFavorite => _isFavorite!;
  set setIsFavorite (bool isFavorite){
    _isFavorite = isFavorite;
  }

  void isFavorite(){
    _isFavorite = !_isFavorite!;
  }
}

class CustomCard extends StatefulWidget {
  final BingoModel bingo;

  const CustomCard({Key? key, required this.bingo}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          SizedBox(
            height: 150,
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
                SizedBox(width: 280,
                  child: _isButtonVisible(),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _image(){
    _childImage(){
      if(widget.bingo.getImageUrl != ''){
        return Image.network(widget.bingo.getImageUrl, width: 125, height: 125, fit: BoxFit.fill);
      } else {
        return const SizedBox(width: 125, height: 125, child: Icon(Icons.image_not_supported_outlined, size: 50,),);
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
      width: 230,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.bingo.getName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey ),
          ),
          const SizedBox(height: 5),
          Text(DateFormat("dd/MM - yyyy").format(widget.bingo.getDate),
            style: const TextStyle(
              fontSize: 17.0,
              //fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
            textAlign: TextAlign.left,),
          //const SizedBox(height: 35.0,),
          const SizedBox(height: 5),
          Text(widget.bingo.getPrice != 0 ? '\u0024${widget.bingo.getPrice}' : " ",
            style: const TextStyle(color: Color(0xff0000b2), fontSize: 17.0, fontWeight: FontWeight.bold,),),
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
          const SizedBox(height: 10,),
          _buttonShare(),
        ],
      ),
    );
  }
  
  Widget _buttonFavorite() {
    Widget _icon() {
      if (widget.bingo.getIsFavorite) {
        return const Icon(Icons.star, color: Colors.amber,size: 30,);
      }else{
        return const Icon(Icons.star_border, color: Colors.grey, size: 30);
      }
    }
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
          borderRadius:BorderRadius.circular(32) ,
          onTap: (){
            setState(() { widget.bingo.isFavorite(); }); },
        child:SizedBox(
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
          onTap: null,
          borderRadius: BorderRadius.circular(32) ,
          child: const SizedBox(width: 32, height: 32,
            child: Icon(Icons.share_outlined,color: Colors.grey,size: 25,),
          )
      ),
    );
  }

  Widget _isButtonVisible() {
    return widget.bingo.getPrice != 0 ? CustomButton(text: "Comprar",) : const SizedBox.shrink();
  }
}