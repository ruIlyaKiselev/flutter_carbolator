import 'package:flutter/cupertino.dart';

class ResultListItem extends StatelessWidget {

  ResultListItem({
    Key? key,
    required this.imageName,
    required this.text
  }) : super(key: key);

  String imageName;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            width: 50,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: Color(0xFF4f4f4f),
                  fontWeight: FontWeight.w800,
                  fontSize: 30
              ),
            ),
          )
        ],
      ),
    );
  }
}