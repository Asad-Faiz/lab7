import 'package:bmi_calculator_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Screen2(this.bmi, {Key? key}) : super(key: key);
  double bmi;
  String bmiStatus = "None";
  String status="none";
  @override
  Widget build(BuildContext context) {
    if (bmi < 18.5) {
      bmiStatus = "You are UndereWeight";
      status="UnderWeight";  
    } else if (bmi>18.5&&bmi<24.9) {
      bmiStatus = "You are Normal";
      status="Normal";        
    } 
     else if (bmi>25&&bmi<29.9) {
      bmiStatus = "You are Over Weight";
      status="Over Weight";        
    } 
     else if (bmi>30) {
      bmiStatus = "You are Obesity";
      status="Obesity";      
    } 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
          backgroundColor: Color.fromARGB(255, 17, 22, 58),
          title: Center(
            child: Text("BMI Calculator"),
          ),
        ),
        body: Container(
              height: double.infinity,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Your Result ",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 60, 20, 60),
                color: Color.fromARGB(255, 29, 30, 51),
                width: double.infinity,
                height: 430,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$status ",
                        style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 36, 230, 123)),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "${bmi.toStringAsFixed(2)} ",
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        "$bmiStatus ",
                        style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  print("Re-Calculate");
                },
                child: Container(
                   decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(30)),
                  width: double.infinity,
                  height: 60,
                  
                  child: Center(
                      child: Text(
                    "Re-Calculate ",
                    style: TextStyle(fontSize: 25,color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
        backgroundColor: kContainerColor,
      ),
    );
  }
}
