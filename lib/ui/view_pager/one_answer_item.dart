import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {

  CustomRadioButton({
    Key? key,
    required this.size,
    required this.text,
    required this.resetButtonsCallback
  }) : super(key: key);

  bool isSelected = false;
  String text;
  double size;
  Function(String text) resetButtonsCallback;

  @override
  State createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        widget.resetButtonsCallback.call(widget.text)
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
          Expanded(
              child: Container(
                padding: EdgeInsets.all(widget.size / 4),
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: const Color(0xFF4f4f4f),
                      fontWeight: FontWeight.w800,
                      fontSize: widget.size * 2 / 3
                  ),
                  textAlign: TextAlign.start,
                ),
              )
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
          Offset(size.width / 2, size.height / 2),
          min(size.width, size.height) / 2,
          Paint()
            ..color = const Color(0xFF4f4f4f)
      );
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2),
          min(size.width, size.height) * 3 / 8,
          Paint()
            ..color = Colors.white
            ..strokeWidth = 2
      );
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2),
          min(size.width, size.height) / 4,
          Paint()
            ..color = const Color(0xFF4f4f4f)
      );
    } else {
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2),
          min(size.width, size.height) / 2,
          Paint()..color = const Color(0xFF4f4f4f)
      );
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2),
          min(size.width, size.height) * 3 / 8,
          Paint()..color = Colors.white
      );
    }

  }

  @override
  bool shouldRepaint(RadioButtonPainter oldDelegate) {
    return oldDelegate.isSelected != isSelected;
  }
}