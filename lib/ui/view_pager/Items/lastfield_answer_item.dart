import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRadioButtonWithText extends StatefulWidget {

  CustomRadioButtonWithText({
    Key? key,
    required this.size,
    required this.text,
    required this.resetButtonsCallback
  }) : super(key: key);

  bool isSelected = false;
  String text;
  double size;
  Function(String text)? resetButtonsCallback;

  @override
  State createState() => _CustomRadioButtonWithTextState();
}

class _CustomRadioButtonWithTextState extends State<CustomRadioButtonWithText> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        widget.resetButtonsCallback?.call(widget.text)
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: RadioButtonPainter(isSelected: widget.isSelected),
          ),
          Container(
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
          ),
          SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: TextFormField(
                cursorColor: Colors.black,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: true),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.blueAccent),

                    ),
                ),
              ),
            ),
          ),
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