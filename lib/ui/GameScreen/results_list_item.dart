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
    return Row(
      children: [
        Image.asset(imageName),
        Text(text)
      ],
    );
  }
}