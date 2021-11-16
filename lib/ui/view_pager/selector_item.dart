import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSelector extends StatefulWidget {

  CustomSelector({
    Key? key,
    required this.size,
    required this.min,
    required this.max,
    required this.text,
    required this.secondText
  }) : super(key: key);

  bool isSelected = false;
  int min;
  int max;
  String text;
  String secondText;
  double size;

  @override
  State createState() => _CustomSelectorState();
}

class _CustomSelectorState extends State<CustomSelector> {

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
            painter: MinusComponentPainter(),
          ),
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: PlusComponentPainter(),
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

class PlusComponentPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
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
    canvas.drawLine(
        Offset(size.width / 2, size.height * 0.3),
        Offset(size.width / 2, size.height * 0.7),
    Paint()
      ..color = Color(0xFF4f4f4f)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
    );
    canvas.drawLine(
        Offset(size.height * 0.3, size.width / 2),
        Offset(size.height * 0.7, size.width / 2),
        Paint()
          ..color = Color(0xFF4f4f4f)
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MinusComponentPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
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
    canvas.drawLine(
        Offset(size.height * 0.3, size.width / 2),
        Offset(size.height * 0.7, size.width / 2),
        Paint()
          ..color = Color(0xFF4f4f4f)
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SelectorPainter extends CustomPainter {

  bool isSelected;

  SelectorPainter({required this.isSelected});

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
  bool shouldRepaint(SelectorPainter oldDelegate) {
    return oldDelegate.isSelected != isSelected;
  }
}