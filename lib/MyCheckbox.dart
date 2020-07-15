import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  MyCheckbox({this.isCheck = false, this.callback});

  bool isCheck;
  final callback;

  @override
  State<StatefulWidget> createState() {
    return _MyCheckboxState();
  }
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool value;

  @override
  void initState() {
    super.initState();
    value = widget.isCheck;
  }
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: (bool value) {
        widget.callback(value);
        setState(() {
          this.value = value;
        });
      },
      value: value
    );
  }
}

