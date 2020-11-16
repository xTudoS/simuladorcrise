import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressed;
  Button({@required this.label, @required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      elevation: 10,
          padding: EdgeInsets.all(10),
          onPressed: this.onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(this.icon, color: Color(0xFFFF6D70),),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  this.label,
                  style: TextStyle(
                    color: Color(0xFF245393),
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          )

    );
  }
}
