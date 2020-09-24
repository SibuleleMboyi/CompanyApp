import 'package:flutter/material.dart';
class CardButtons extends StatelessWidget {

  final double height;
  final Icon icon;
  final String label;
  final Function onTap;

  const CardButtons({
    Key key,

    @required this.height,
    @required this.icon,
    @required this.label,
    @required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child:Container(
          height: height == 31.0 ? 31.0:height, //  height is either 31.0 or  51.0
          child:  Column(
            children: [
              icon,
              Text(label),
              const SizedBox(width: 45.0),
            ],
          ),
        ),

      ),
    );
  }
}