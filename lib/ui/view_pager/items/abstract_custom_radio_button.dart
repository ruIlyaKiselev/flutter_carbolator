import 'package:flutter/cupertino.dart';

abstract class AbstractCustomRadioButton extends StatefulWidget{
  const AbstractCustomRadioButton({Key? key}) : super(key: key);

  bool isSelected();
  void select();
  void unselect();
  String getText();
  void resetCallback(String text);
}