import 'package:flutter/material.dart';

class Piecard extends StatelessWidget {
  String title ;
  String value;
   Piecard({Key? key,required this.value,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Text(value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
