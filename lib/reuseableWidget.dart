import 'package:flutter/material.dart';
class resuableWidget extends StatelessWidget {
 
 dynamic? Color;
 final newChild;
 dynamic? Width;

 //constructor
 resuableWidget({required this.Color,required this.newChild,this.Width}); 
  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color,
                  ),
                height: 200,
                width: Width,
               child: newChild,
              );
  }
}  