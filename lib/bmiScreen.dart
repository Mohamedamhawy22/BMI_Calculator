import 'dart:math';
import 'package:flutter/material.dart';
import 'bmi_result_screen.dart';

class BmiScreen extends  StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BmiScreenState();
}
class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true ;
  double height = 120.0 ;
  int weight = 45 ;
  int age = 18 ;
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator ', textAlign: TextAlign.center,),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true ;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/male.jpg'),
                                height: 90.0,
                              width: 90.0,
                            ) ,
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('MALE',style: TextStyle(
                              fontSize: 25.0 ,
                              fontWeight: FontWeight.bold ,
                            ),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale? Colors.deepPurple : Colors.cyan,
                        ) ,
                      ),
                    ),
                  ) ,
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false ;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/female.png'),
                                height: 90.0,
                                width: 90.0,

                              ) ,
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('FEMALE',style: TextStyle(
                                fontSize: 25.0 ,
                                fontWeight: FontWeight.bold ,
                              ),),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: !isMale? Colors.deepPurple : Colors.cyan,
                          ) ,
                        ),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('HEIGHT',
                    style: TextStyle(
                  fontSize: 25.0 ,
                  fontWeight: FontWeight.bold ,
                ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                      Text('${height.round()}',
                        style: TextStyle(
                          fontSize: 40.0 ,
                          fontWeight: FontWeight.w900,
                        ),),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Cm',
                        style: TextStyle(
                          fontSize: 15.0 ,
                          fontWeight: FontWeight.bold,
                        ),)
                    ],),
                    Slider(
                      activeColor : Colors.deepPurple ,
                      value:height ,
                      max: 220.0,
                      min: 80.0,
                      onChanged:(value){
                        setState(() {
                          height = value ;
                        });
                      } ,),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.cyan
                ),
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',
                            style: TextStyle(
                              fontSize: 25.0 ,
                              fontWeight: FontWeight.bold ,
                            ),),
                          Text('${age}',
                              style: TextStyle(
                              fontSize: 40.0 ,
                              fontWeight: FontWeight.w900,
                              ),) ,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                heroTag: 'age -',
                                mini: true,
                                child: Icon (Icons.remove) ,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: 'age+',
                                mini: true,
                                child: Icon (Icons.add) ,
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.cyan
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child:
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',
                          style: TextStyle(
                            fontSize: 25.0 ,
                            fontWeight: FontWeight.bold ,
                          ),),
                        Text('${weight}',
                          style: TextStyle(
                            fontSize: 40.0 ,
                            fontWeight: FontWeight.w900,
                          ),) ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  weight-- ;
                                });
                              },
                              heroTag: 'weight=',
                              mini: true,
                              child: Icon (Icons.remove) ,
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  weight++ ;
                                });
                              },
                              heroTag: 'weight +',
                              mini: true,
                              child: Icon (Icons.add) ,
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.cyan
                    ),
                  ),
                  )],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color:Colors.cyan ,
            child: MaterialButton(
              onPressed: (){
                double result = weight / pow(height / 100 , 2 );
                print(result.round()) ;
                Navigator.push(context, MaterialPageRoute(builder: (context) => BMIResultScreen(
                  age: age,
                  isMale: isMale,
                  result: result.round(),
                ) ,),);
              } ,
              height: 50.0,
              child: Text('CALCULATE'),
            ),
          )
        ],
      ),
    );
  }



}