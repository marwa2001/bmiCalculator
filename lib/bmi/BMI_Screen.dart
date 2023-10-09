import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bmi_result/bmi_result_screen.dart';

class BMiScreen extends StatefulWidget {

  @override
  State<BMiScreen> createState() => _BMiScreenState();
}

class _BMiScreenState extends State<BMiScreen> {
  bool isMale=true;
  double hight=120;
  int age=20;
  int weight=40;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',
        style:TextStyle(fontSize: 20,
            color: Colors.blue,
            fontWeight: FontWeight.bold) ,
        ),

      ),
      body: Column(
        children: [
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Row(

               children: [
                 Expanded(
                   child:GestureDetector(
                     onTap: (){
                       setState(() {
                     isMale=true;
                       });
                     },
                     child: Container(

                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [

                            Image(image:AssetImage('images/man.png'),
                            height: 60,
                            width: 60),
                             SizedBox(
                              height: 10,
                             ),
                             Text('Male',
                             style: TextStyle(fontSize: 20,
                               color: Colors.blue[700],
                               fontWeight: FontWeight.bold),)

                           ],
                         ),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                               color: isMale? Colors.amber:Colors.grey[300],

                       ),
                       ),
                   ),
                   ),
                SizedBox(width: 20),
                 Expanded(
                   child:
                     GestureDetector(
                       onTap: (){
                         setState(() {
                           isMale=false;
                         });
                       },
                       child: Container(

                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image:AssetImage('images/girl.png'),
                               height: 60,
                               width: 60),
                             SizedBox(
                               height: 10),
                             Text('Female',
                               style: TextStyle(
                                   color: Colors.blue[700],
                                 fontSize: 20, fontWeight: FontWeight.bold),)

                           ],
                         ),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                           color: !isMale? Colors.amber:Colors.grey[300],

                         ),
                       ),
                     ),
                   ),
                ],
             ),
           )
         ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
    children: [
                    Text('Hight',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w500,
                      ),),
      Row(
        mainAxisAlignment:MainAxisAlignment.center,
        //180cm محاذاه سم
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text('${hight.round()}',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
              fontWeight: FontWeight.w700,
            ),),
          Text('cm',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),),
        ],
      ),
      Slider(value: hight,
          max: 220,
          min: 80,
          onChanged: (value){
       setState(() {
         hight=value;
       });
        },
      )
           ], ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  

                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(child:
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Expanded(
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('AGE',
                             style: TextStyle(
                               fontSize: 20,
                               color: Colors.blue[700],
                               fontWeight: FontWeight.w700,
                             ),),
                           Text('$age',
                             style: TextStyle(
                               fontSize: 20,
                               color: Colors.blue,
                               fontWeight: FontWeight.w700,
                             ),),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(
                             onPressed: (){
                               setState(() {
                                 age--;
                               });
                             },
                               heroTag: 'age-',
                             mini: true,
                             child: Icon(
                                 Icons.remove
                             ),
          ),
                             FloatingActionButton(
                               onPressed: (){
                                 setState(() {
                                   age++;
                                 });
                               },
                               heroTag: 'age-',
                               mini: true,
                               child: Icon(
                                   Icons.add
                               ),
                             ),
                           ],
                         ),
              ],
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.grey[300],

                       ),
                     ),

                 ),
                 SizedBox(width: 20,),
                 Expanded(
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('WeIGHT',
                             style: TextStyle(
                               fontSize: 20,
                               color: Colors.blue[700],
                               fontWeight: FontWeight.w700,
                             ),),
                           Text('$weight kg',
                             style: TextStyle(
                               fontSize: 20,
                               color: Colors.blue,
                               fontWeight: FontWeight.w700,
                             ),),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     weight--;
                                   });
                                 },
                                 heroTag: 'weight-',
                                 mini: true,
                                 child: Icon(
                                     Icons.remove
                                 ),
                               ),
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     weight++;
                                   });
                                 },
                                 heroTag: 'weight+',
                                 mini: true,
                                 child: Icon(
                                     Icons.add
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.grey[300],

                       ),
                     ),

                 ),
               ],
             ),
           ),
          ),
              SizedBox(height: 20,
    ),


              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(

                  width: double.infinity,
                   height: 60,
                  child: MaterialButton(onPressed: (){
                    var result=weight/pow(hight/100,2);
                    print(result.round());
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>BMIResultScreen(
                          age: age,
                          isMale:isMale,
                          result:result.round(),
                        ),
                        )

                    );
                  },
            child:Text('Calculate',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,

                ),
            )),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,

                  ),
                ),
              ),




        ],

      ),
    );
  }
}
