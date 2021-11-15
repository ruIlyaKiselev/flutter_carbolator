import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneAnswerItem extends StatefulWidget  {

  const OneAnswerItem({Key? key}) : super(key: key);

  @override
  _MyState createState() {
    return _MyState();
  }
}

class _MyState extends State<OneAnswerItem>
{
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Male"),
          leading: Radio(
            value: 1,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = value as int;
              });
            },
            activeColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text("Female"),
          leading: Radio(
            value: 2,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = value as int;
              });
            },
            activeColor: Colors.green,
          ),
        ),
      ],
    );
  }
}