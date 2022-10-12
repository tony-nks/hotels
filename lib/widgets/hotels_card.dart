import 'package:flutter/material.dart';

class HotelsCard extends StatelessWidget {
  const HotelsCard({Key? key, required this.title, required this.image}) : super(key: key);
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset('assets/images/$image', fit: BoxFit.cover,),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(title),
              SizedBox(width: 5),
              ElevatedButton(onPressed: null, child: Text('Подробнее', style: TextStyle(color: Colors.white),),
              style: ButtonStyle(
                 backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              ),),
            ],
          )
        ],
      ),
    );
  }
}
