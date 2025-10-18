import 'package:flutter/material.dart';
import 'package:nafas/features/home/presentation/screens/bmi_page.dart';
import 'package:nafas/features/home/presentation/screens/calories_page.dart';

import 'package:nafas/features/home/presentation/screens/fats_page.dart';
import 'package:nafas/features/home/presentation/screens/water_page.dart';

class CalculatorsPage extends StatelessWidget {
  const CalculatorsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
    }, icon:Icon(Icons.arrow_back),color: Colors.green,),
        title:
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text('Calculators',style: TextStyle(color: Colors.green,),
          ),
        ),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child:
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>BmiPage() ));
              },
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Text('حاسبة الكتلة',style: TextStyle(color: Colors.black,fontSize:25),),
                ),
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child:
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Water()));
              },
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Text('حاسبة الماء',style: TextStyle(color: Colors.black,fontSize:25),),
                ),
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child:
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CaloriesPage()));
              },
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Text('حاسبة السعيرات',style: TextStyle(color: Colors.black,fontSize:25),),
                ),
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child:
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Fats()));
              },
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Text('حاسبة الدهون',style: TextStyle(color: Colors.black,fontSize:25),),
                ),
              ),
            ),

          ),

        ],
      ),

    );
  }
}
