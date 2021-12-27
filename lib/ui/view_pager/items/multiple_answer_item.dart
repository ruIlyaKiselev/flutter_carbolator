import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {

  bool isSelected = false;
  String text = "";
  double size;
  Function(String text)? resetButtonsCallback;

  CustomCheckBox({
    Key? key,
    required this.size,
    required this.text,
    required this.resetButtonsCallback,
    required this.isSelected
  }) : super(key: key);

  @override
  State createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          widget.isSelected = !widget.isSelected;
          widget.resetButtonsCallback?.call(widget.text);
        })
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: CheckBoxPainter(isSelected: widget.isSelected),
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
                  maxLines: 6,
                  textAlign: TextAlign.start,
                ),
              )
          )
        ],
      ),
    );
  }
}

class CheckBoxPainter extends CustomPainter {

  bool isSelected;

  CheckBoxPainter({required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {

    if (isSelected) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(size.width / 2, size.height / 2),
                  width: size.width,
                  height: size.height
              ),
              Radius.circular(min(size.width, size.height) * 5 / 16)
          ),
          Paint()
            ..color = const Color(0xFF4f4f4f)
      );
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(size.width / 2, size.height / 2),
                  width: size.width * 3 / 4,
                  height: size.height * 3 / 4
              ),
              Radius.circular(min(size.width, size.height) / 4)
          ),
          Paint()
            ..color = Colors.white
      );
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(size.width / 2, size.height / 2),
                  width: size.width / 2,
                  height: size.height / 2
              ),
              Radius.circular(min(size.width, size.height) / 8)
          ),
          Paint()
            ..color = const Color(0xFF4f4f4f)
      );
    } else {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(size.width / 2, size.height / 2),
                  width: size.width,
                  height: size.height
              ),
              Radius.circular(min(size.width, size.height) * 5 / 16)
          ),
          Paint()
            ..color = const Color(0xFF4f4f4f)
      );
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(size.width / 2, size.height / 2),
                  width: size.width * 3 / 4,
                  height: size.height * 3 / 4
              ),
              Radius.circular(min(size.width, size.height) / 4)
          ),
          Paint()
            ..color = Colors.white
      );
    }
  }

  @override
  bool shouldRepaint(CheckBoxPainter oldDelegate) {
    return oldDelegate.isSelected != isSelected;
  }
}