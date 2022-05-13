import 'package:flutter/material.dart';

class TitleOfScreen extends StatelessWidget {

  final String title;

  const TitleOfScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
        decoration: _titleStyle(),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            )
          ),
        ),
      )
    );
  }

  BoxDecoration _titleStyle() => BoxDecoration(
    color:Colors.transparent,
    borderRadius: BorderRadius.circular(17)
  );
}