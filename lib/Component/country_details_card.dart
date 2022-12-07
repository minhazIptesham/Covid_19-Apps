import 'package:flutter/material.dart';

class CountryDetailsCard extends StatelessWidget {
  String title;
  String value;
  String iconImage;
  CountryDetailsCard({Key? key,required this.title,required this.value, required this.iconImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(title,style: TextStyle(color: Colors.black,fontSize:size.height*.025,fontWeight: FontWeight.bold),),
          subtitle: Text(value,style: TextStyle(color: Colors.purple,fontSize:size.height*.020,fontWeight: FontWeight.bold),),
          trailing: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage:AssetImage(iconImage),
          ),
        ),
      ),
    );
  }
}


