
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {

  CustomRadioButton({required this.size, required this.text});

  bool isSelected = false;
  String text = "";
  double size;

  @override
  State createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        print("new event"),
        setState(() {
          widget.isSelected = !widget.isSelected;
        })
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: RadioButtonPainter(isSelected: widget.isSelected),
          ),
          Text(
            widget.text,
            style: const TextStyle(
                fontFamily: "Montserrat",
                color: Color(0xFF4f4f4f),
                fontWeight: FontWeight.w800,
                fontSize: 20
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class RadioButtonPainter extends CustomPainter {

  bool isSelected;

  RadioButtonPainter({required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    if (isSelected) {
      canvas.drawCircle(
          Offset.zero,
          min(size.width, size.height),
          Paint()..color = const Color(0xFF4f4f4f)
      );
      canvas.drawCircle(
          Offset.zero,
          min(size.width, size.height) * 3 / 4,
          Paint()..color = Colors.white
      );
      canvas.drawCircle(
          Offset.zero,
          min(size.width, size.height) / 2,
          Paint()..color = const Color(0xFF4f4f4f)
      );
    } else {
      canvas.drawCircle(
          Offset.zero,
          min(size.width, size.height),
          Paint()..color = const Color(0xFF4f4f4f)
      );
      canvas.drawCircle(
          Offset.zero,
          min(size.width, size.height) * 3 / 4,
          Paint()..color = Colors.white
      );
    }

  }

  @override
  bool shouldRepaint(RadioButtonPainter oldDelegate) {
    return oldDelegate.isSelected != isSelected;
  }
}