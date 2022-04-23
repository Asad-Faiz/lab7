import 'package:bmi_calculator_app/constant.dart';
import 'package:bmi_calculator_app/resultScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'ChildW.dart';
import 'reuseableWidget.dart';

void main() {
  runApp(Screen1());
}

// declaring enum

enum gender { male, female }

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber[300],
        accentColor: Color.fromARGB(255, 13, 18, 53),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  gender? selectedGender;
  String g="none";
  late double value=0;
  double height = 180;
  int weight = 60;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 13, 18, 53) ,
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 17, 22, 58) ,
        leading: IconButton(icon: Icon(Icons.menu),onPressed: (){},),
        
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Container(
          //   margin: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Color(0xff0a0e21),
          //     ),
          //   height: 200,
          //   width: 170,

          // ),
          Expanded(
              //first row
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //----------Female-------------
              GestureDetector(
                onTap: () {
                  print("Female Button");
                  setState(() {
                    selectedGender = gender.female;
                    g="female";
                  });
                },
                child: resuableWidget(
                  Color: selectedGender == gender.female
                      ? activeCardColor
                      : inactiveCardColor,
                  Width: 170,
                  newChild: ChildW(
                    nicon: Icon(
                      Icons.female,
                      size: 50,
                    ),
                    nText: "Female",
                  ),
                ),
              ),
              //----------------Male ----------------------------
              GestureDetector(
                //onTap make it clickable
                onTap: (() {
                  print("Male Button");
                  setState(() {
                    selectedGender = gender.male;
                    g="male";
                  });
                }),
                child: resuableWidget(
                  //use ternary operator to change color if active
                  Color: selectedGender == gender.male
                      ? activeCardColor
                      : inactiveCardColor,
                  Width: 170,
                  newChild: ChildW(
                    nicon: Icon(
                      Icons.male,
                      size: 50,
                    ),
                    nText: "Male",
                  ),
                ),
              ),
            ],
          )),

          //2nd row
//-------------------------Slider ------------------------------
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              resuableWidget(
                  Color: kContainerColor,
                  Width: 360,
                  newChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff52545f)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.round().toString(),
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("cm"),
                        ],
                      ),
                      SliderTheme(
                        
                        data: SliderTheme.of(context).copyWith(
                          
                          thumbColor: Color.fromARGB(255, 211, 30, 90),
                          inactiveTrackColor: Color(0xff63626c),
                          activeTrackColor: Color.fromARGB(255, 211, 30, 90),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 10.0,
                          ),
                          overlayColor: Color.fromARGB(
                              255, 211, 30, 90), 
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 12,
                          ),
                        ),

                        child: Slider(
                          value: height,
                          min: 180,
                          max: 320,
                          

                          onChanged: (value) {
                            setState(() {
                              height =
                                  value;
                            });
                            print(value.round());
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          )),

          //3rd row
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                resuableWidget(
                  Color: kContainerColor,
                  Width: 170,
                  newChild: CustomContainer(
                    "Weight",
                    weight,
                    () {
                      setState(() {
                        weight++;
                      });
                    },
                    () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                ),
                resuableWidget(
                  Color: kContainerColor,
                  Width: 170,
                  newChild: CustomContainer(
                    "Age",
                    age,
                    () {
                      setState(() {
                        age++;
                      });
                    },
                    () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              
              if(g=="male"){
                 value = (weight / (height * height)) * 10000;
              }if (g=="female") {
                 value = (weight / (height * height)) * 10000;
              } 
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => Screen2(value))));
              print("Calculate");
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(30)),
              width: double.infinity,
              height: 60,
              
              child: Center(
                  child: Text(
                "Calculate ",
                style: TextStyle(fontSize: 25),
              )),
            ),
          )
        ]),
      ),
    );
  }

// method
  Column CustomContainer(
    String text,
    int text2,
    Function function1,
    Function function2,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$text",
          style: TextStyle(fontSize: 15, color: Color(0xff52545f)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$text2",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {
                function1();
              },shape: CircleBorder(),
              child: Icon(Icons.add,size: 50),
            ),
            FlatButton(
              onPressed: () {
                function2();
              },shape: CircleBorder(),
              child: Icon(Icons.remove,size: 50),
            )
          ],
        )
      ],
    );
  }
}
