import 'package:flutter/material.dart';
import 'package:new_app/widgets/CardButtons.dart';

class LabelledButtons extends StatelessWidget {
  final IconData icon;
  final double  iconSize;
  final Function onPressed;
  final String label;

  const LabelledButtons({
    Key key,
    @required this.icon,
    @required this.iconSize,
    @required this.onPressed,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: CardButtons(
        icon: Icon(icon,
          size: iconSize,
          color: Colors.black,
        ),
        label : label,
        onTap: onPressed,

      ),
    );
  }
}
