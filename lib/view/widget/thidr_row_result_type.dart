import 'package:flutter/material.dart';


class ThirdRowResultType extends StatelessWidget {

  const ThirdRowResultType({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Flexible(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Icon(Icons.square,color: color,size: 26,),
            ),
          ),
        ),
        Text(text,style: const TextStyle(fontSize: 10,),)
      ],
    );
  }
}