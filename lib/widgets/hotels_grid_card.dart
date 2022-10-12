import 'package:flutter/material.dart';

class HotelsCardGrid extends StatelessWidget {
  const HotelsCardGrid({Key? key, required this.title, required this.image}) : super(key: key);
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(2,1),
                blurRadius: 5,
                color: Colors.black45
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset('assets/images/$image', fit: BoxFit.cover,),
            ),
          ),
          Padding(padding: EdgeInsets.all(5),
          child: Text(title)),
          ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            child: Container(
              color: Colors.blue,
              height: 35,
              width: double.infinity,
              child: TextButton(
                onPressed: null, child: Text('Подробнее', style: TextStyle(color: Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
