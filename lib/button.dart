// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  bool isEnabled;
  Function? onTap;
  final IconData? icon;
  final String? iconPath;
  final Color borderColor;
  final double borderWidth;

  CustomButton({
    super.key,
    required this.text,
    this.height = 60,
    this.width = double.infinity,
    this.backgroundColor = Colors.teal,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.isEnabled = true,
    this.onTap,
    this.icon,
    this.iconPath,
    this.iconColor = Colors.white,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: widget.borderWidth,
          color: widget.borderColor,
        ),
        borderRadius: BorderRadius.circular(widget.height / 2),
        color: widget.isEnabled ? widget.backgroundColor : Colors.grey,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: widget.isEnabled ?  widget.backgroundColor : Colors.transparent,
          splashFactory: widget.isEnabled ? InkSplash.splashFactory : NoSplash.splashFactory,
          borderRadius: BorderRadius.circular(widget.height / 2),
          onTap: _onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Icon(),
              _text(),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(){
    widget.isEnabled ? widget.onTap!() : null;}

  Widget _Icon() {
    if (widget.iconPath != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Image.asset(
          widget.iconPath!,
          height: 35,
          width: 35,
          fit: BoxFit.cover,
          color: widget.iconColor,
        ),
      );
    }

    if (widget.icon != null && widget.iconPath == null) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(
          widget.icon,
          color: widget.iconColor,
          size: 35,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _text(){
    return Text(
      widget.text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: widget.textColor,
        fontSize: 25,
        letterSpacing: 3,
      ),
    );
  }

}
