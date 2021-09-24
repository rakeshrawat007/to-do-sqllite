import 'package:flutter/material.dart';
import 'package:local_push_notifcation/ui/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function onTap;

  MyButton({Key? key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:  Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: primaryClr),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      onTap: () =>onTap
    );
  }
}
