import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {

  CustomCheckBox({Key? key, required this.size, required this.text}) : super(key: key);

  bool isSelected = false;
  String text = "";
  double size;

  @override
  State createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

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
            painter: CheckBoxPainter(isSelected: widget.isSelected),
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
              Radius.circular(8)
          ),
          Paint()
            ..color = Color(0xFF4f4f4f)
      );
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(size.width / 2, size.height / 2),
                  width: size.width * 3 / 4,
                  height: size.height * 3 / 4
              ),
              Radius.circular(8)
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
              Radius.circular(4)
          ),
          Paint()
            ..color = Color(0xFF4f4f4f)
      );
    } else {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(size.width / 2, size.height / 2),
                  width: size.width,
                  height: size.height
              ),
              Radius.circular(8)
          ),
          Paint()
            ..color = Color(0xFF4f4f4f)
      );
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(size.width / 2, size.height / 2),
                  width: size.width * 3 / 4,
                  height: size.height * 3 / 4
              ),
              Radius.circular(8)
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