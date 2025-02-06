import 'package:flutter/material.dart';

import 'colors.dart';

class xoButton extends StatelessWidget {
  String letter;
  int index;
  Function onClickButton;
  xoButton(
      {required this.onClickButton, required this.letter, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:Container(
          margin: EdgeInsets.all(6),  // Keep margin here if needed around the button
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( AppColors.darkblue),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(
                color: AppColors.sky
              ),
                borderRadius: BorderRadius.circular(10),  // Optional, to round the edges of the button
              )),
            ),
            onPressed: () {
              onClickButton(index);
            },
            child: Center(
              child: Text(
                letter,
                style: TextStyle(fontSize: 55,color: Color(0xffEEEEEE)),
              ),
            ),
          ),
        )
    );
  }
}
