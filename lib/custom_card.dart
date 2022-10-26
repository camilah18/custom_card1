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

  /// ---- INFO ----
  ///
  /// Grupo: Integrantes del grupo: Apaza, Celina ; Herrera, Camila ; Marín Sofía;
  /// Con este widget se puede mostrar la información de un bingo en una card personalizada;
  /// La card cuenta con un botón para añadir a favoritos y otro para compartir;
  /// El título y la fecha son datos requeridos;
  /// Además, cuenta con la posibilidad de mostrar un botón para comprar si es que se le añade un precio.

  BingoModel(int? id, String? name, DateTime? date, String? imageUrl, double? price){
    _id = id;
    _name = name;
    _date = date;
    _imageUrl = imageUrl;
    _price = price;
    _isFavorite = false;
  }

  int gedId() => _id!;
  setId (int id){
    _id = id;
  }

  String getName() => _name!;
  setName (String name){
    _name = name;
  }

  DateTime getDate() => _date!;
  setDate (DateTime date){
    _date = date;
  }

  String getImageUrl() => _imageUrl!;
  setImageUrl (String imageUrl){
    _imageUrl = imageUrl;
  }

  double getPrice() => _price!;
  setPrice (double price){
    _price = price;
  }

  bool getIsFavorite() => _isFavorite!;
  setIsFavorite (bool isFavorite){
    _isFavorite = isFavorite;
  }

  void isFavorite(){
    _isFavorite = !_isFavorite!;
  }
}

class CustomCard extends StatefulWidget {
  final BingoModel bingo;
  final Function stateFavorite;
  final Function shareIt;
  final Function shoppIt;

  const CustomCard({Key? key, required this.shoppIt, required this.stateFavorite, required this.shareIt ,required this.bingo}) : super(key: key);

  getModel(){
    return bingo;
  }

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  isFavorite() {
    setState(() {
      widget.bingo.setIsFavorite(!(widget.bingo.getIsFavorite()));
    });
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
    childImage(){
      if(widget.bingo.getImageUrl() != ""){
        return SizedBox(
            width: 125,
            height: 125,
            child: Image.network(widget.bingo.getImageUrl(), fit: BoxFit.fill)
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
          child: childImage(),
      )
    );
  }
  
  Widget _dataCard(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.bingo.getName(),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle( fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey ),
        ),
        const SizedBox(height: 5),
        Text(DateFormat("dd/MM - yyyy").format(widget.bingo.getDate()),
          style: const TextStyle(
            fontSize: 18.0,
            //fontWeight: FontWeight.bold,
            color: Colors.grey
          ),
          textAlign: TextAlign.left,),
        //const SizedBox(height: 35.0,),
        const SizedBox(height: 5),
        Text(widget.bingo.getPrice() != 0 ? '\u0024${widget.bingo.getPrice().round()}' : " ",
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
    Widget icon() {
      if (widget.bingo.getIsFavorite()) {
        return const Icon(Icons.star, color: Colors.amber,size: 23,);
      }else{
        return const Icon(Icons.star_border, color: Colors.grey, size: 23);
      }
    }
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
          borderRadius:BorderRadius.circular(32) ,
          onTap:(){
            isFavorite();
            widget.stateFavorite(widget.bingo);
          },
          child:SizedBox(
          //padding: EdgeInsets.all(1),
          width: 32,
          height: 32,
          child: icon(),
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
            widget.shareIt(widget.bingo);
          },
          borderRadius: BorderRadius.circular(32) ,
          child: const SizedBox(width: 32, height: 32,
            child: Icon(Icons.share_outlined,color: Colors.grey,size: 23,),
          )
      ),
    );
  }

  Widget _isButtonVisible() {
    return widget.bingo.getPrice() != 0 ? CustomButton(
      onTap: (){
        widget.shoppIt(widget.bingo);
      },
      text: "Comprar",
      backgroundColor: const Color(0xff0000b2),
    ): const SizedBox.shrink();
  }
}