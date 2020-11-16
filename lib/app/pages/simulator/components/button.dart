import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function onPressed;
  Button({@required this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      elevation: 10,
          padding: EdgeInsets.all(10),
          onPressed: this.onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
                  this.label,
                  style: TextStyle(
                    color: Color(0xFF245393),
                    fontSize: 25,
                  ),
                ),
    );
  }
}
