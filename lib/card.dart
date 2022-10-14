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

  BingoModel(int id, String? name, DateTime? date, String? imageUrl, double? price){
    _id = id;
    _name = name;
    _date = date;
    _imageUrl = imageUrl;
    _price = price;
    _isFavorite = false;
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

  int? getId(){
    return _id;
  }
}

class CustomCard extends StatefulWidget {
  final BingoModel bingo;
  final Function(int?)? onTapFavorite;
  final Function(int?)? onTapShared;
  final Function(int?)? onTapBought;

  const CustomCard({Key? key, required this.bingo, this.onTapFavorite, this.onTapShared, this.onTapBought}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  int? _getIsFavorite() {
      return widget.bingo.getId();
  }

  int? _getIsShared(){
    return widget.bingo.getId();
  }

  int? _getIsBought(){
    return widget.bingo.getId();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            _image(),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              child: _dataCard()),
                        ),
                        _buttons(),
                      ],
                    ),
                  ),
                 SizedBox(
                   width: double.infinity,
                   height:30,
                   child: _isButtonVisible(),
                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image(){
    _childImage(){
      if(widget.bingo.getImageUrl != ""){
        return SizedBox(
            width: 125,
            height: 125,
            child: Image.network(widget.bingo.getImageUrl, fit: BoxFit.fill)
        );
      } else {
        return const SizedBox(
            width: 125,
            height: 125,
            child: Icon(Icons.image_not_supported_outlined, size: 50,)
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.only(right:15.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: _childImage(),
      )
    );
  }
  
  Widget _dataCard(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.bingo.getName,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle( fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey ),
        ),
        const SizedBox(height: 5),
        Text(DateFormat("dd/MM - yyyy").format(widget.bingo.getDate),
          style: const TextStyle(
            fontSize: 18.0,
            //fontWeight: FontWeight.bold,
            color: Colors.grey
          ),
          textAlign: TextAlign.left,),
        //const SizedBox(height: 35.0,),
        const SizedBox(height: 5),
        Text(widget.bingo.getPrice != 0 ? '\u0024${widget.bingo.getPrice.round()}' : " ",
          style: const TextStyle(color: Color(0xff0000b2), fontSize: 18, fontWeight: FontWeight.bold,),),
      ],
    );
  }

  Widget _buttons(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buttonFavorite(),
        const SizedBox(height: 10,),
        _buttonShare(),
      ],
    );
  }
  
  Widget _buttonFavorite() {
    Widget _icon() {
      if (widget.bingo.getIsFavorite) {
        return const Icon(Icons.star, color: Colors.amber,size: 23,);
      } else {
        return const Icon(Icons.star_border, color: Colors.grey, size: 23);
      }
    }
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
          borderRadius:BorderRadius.circular(32) ,
          onTap: (){
            setState(() {
              widget.bingo.isFavorite();
              if (widget.bingo.getIsFavorite){ widget.onTapFavorite!(_getIsFavorite()); }
            });},
        child:SizedBox(
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
            setState(() {
              widget.onTapShared!(_getIsShared());
            });},
          borderRadius: BorderRadius.circular(32) ,
          child: const SizedBox(width: 32, height: 32,
            child: Icon(Icons.share_outlined, color: Colors.grey, size: 23,),
          )
      ),
    );
  }

  Widget _isButtonVisible() {
    return widget.bingo.getPrice != 0 ? CustomButton(
      text: "Comprar",
      backgroundColor: const Color(0xff0000b2),
      onTap: () { setState(() {
        widget.onTapBought!(_getIsBought());
      });},
    ): const SizedBox.shrink();
  }
}