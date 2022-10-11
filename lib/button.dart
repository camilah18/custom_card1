import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  Color textColor;
  IconData? iconData;
  String? iconPath;
  Color? iconColor;
  Color? backgroundColor;
  Color? borderColor;
  Function()? onTap;
  bool isEnabled;
  EdgeInsets? padding;
  ButtonStyle? _buttonStyle;
  TextStyle? _textStyle;
  FontWeight fontWeight;
  double letterSpacing;
  double fontSize;

  CustomButton(
      {Key? key, this.text, this.iconData, this.iconPath,this.iconColor, this.backgroundColor = Colors.blue,
        this.borderColor, this.onTap, this.isEnabled = true, this.textColor = Colors
          .white, this.padding = const EdgeInsets.only(top: 3.0, bottom: 3.0, left: 8.0, right: 8.0), this.fontWeight = FontWeight.normal, this.letterSpacing = 2.0, this.fontSize = 15}) : super(key: key) {
    iconColor ??= textColor;
    borderColor ??= backgroundColor;
    _textStyle = TextStyle(color: textColor, fontWeight: fontWeight, letterSpacing: letterSpacing, fontSize: fontSize);
    _buttonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      side: BorderSide(color: isEnabled? borderColor!: Colors.transparent, width: 2),
      primary: backgroundColor,
      padding: padding,
      minimumSize:Size.zero,
      textStyle: _textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isEnabled ? onTap??=(){} : null,
        style: _buttonStyle,
        child: Padding(
          padding: padding!,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _icon(),
              _separator(),
              _text(),
            ],
          ),
        ));
  }

  _icon() {
    return iconData == null
        ? iconPath == null
        ? const SizedBox.shrink()
        : ImageIcon(AssetImage(iconPath!), color: iconColor, size: fontSize,)
        : Icon(iconData, color: iconColor, size: fontSize,);
  }

  _separator() {
    if ((iconPath != null || iconData != null) && text != null) {
      return const SizedBox(width: 10,);
    }
    else {
      return const SizedBox.shrink();
    }
  }

  _text() {
    return text != null
        ? Text(text!, style: _textStyle)
        : const SizedBox();
  }
}