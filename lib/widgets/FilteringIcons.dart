import 'package:flutter/material.dart';
import 'package:new_app/widgets/LabelledButtons.dart';

class FilteringIcons extends StatelessWidget {
  final List<LabelledButtons> scrollableIcons;

  const FilteringIcons({
    Key key,
    this.scrollableIcons
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        height: 65.0, //container for  filtering buttons
        color: Colors.red,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: scrollableIcons.length,
          itemBuilder: (BuildContext context, int index){

            final LabelledButtons labelledButtons = scrollableIcons[index];
            return Container(
              //height: 30.0,
              color: Colors.white ,
              child: ScrollButtons(labelledButtons : labelledButtons),
            );
          },)
    );
  }
}

class ScrollButtons extends StatelessWidget {
  final LabelledButtons labelledButtons;

  const ScrollButtons({
    Key key,
    this.labelledButtons
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            labelledButtons,
          ],
      ),
    );
  }
}

