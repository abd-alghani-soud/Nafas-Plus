import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_colors.dart';
import 'package:nafas/features/home/presentation/screens/disease1.dart';
import 'package:nafas/features/home/presentation/screens/disease2.dart';
import 'package:nafas/features/home/presentation/screens/disease3.dart';
import 'package:nafas/features/home/presentation/screens/disease4.dart';
import 'package:nafas/features/home/presentation/screens/disease5.dart';
import 'package:nafas/features/home/presentation/screens/disease6.dart';
import 'package:nafas/features/home/presentation/screens/disease7.dart';
import 'package:nafas/features/home/presentation/screens/disease8.dart';

class Diseases extends StatelessWidget {
  const Diseases({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        appBar: AppBar(backgroundColor: Colors.black,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:Icon(Icons.arrow_back),color: Colors.green,),
          title:
          Padding(
            padding: const EdgeInsets.only(left: 5,top: 5),
            child: Text('Diseases',style: TextStyle(color: Colors.green,fontSize: 30),
            ),
          ),),
        body:
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 70),
          child: ListView(
            children: [

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Disease1()));
                },
                child: Container(height: 80,
                  decoration: BoxDecoration(
                    color: MyColors.greenAccent,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Disease2()));
                },
                child: Container(height: 80,
                  decoration: BoxDecoration(
                    color: MyColors.greenAccent,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Disease3()));
                },
                child: Container(height: 80,
                  decoration: BoxDecoration(
                    color: MyColors.greenAccent,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Disease4()));
                },
                child: Container(height: 80,
                  decoration: BoxDecoration(
                    color: MyColors.greenAccent,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Disease5()));
                },
                child: Container(height: 80,
                  decoration: BoxDecoration(
                    color: MyColors.greenAccent,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Disease6()));
                },
                child: Container(height: 80,
                  decoration: BoxDecoration(
                    color: MyColors.greenAccent,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Disease7()));
                },
                child: Container(height: 80,
                  decoration: BoxDecoration(
                    color: MyColors.greenAccent,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Disease8()));
                },
                child: Container(height: 80,
                  decoration: BoxDecoration(
                    color: MyColors.greenAccent,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 0),

                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(height: 40,),

            ],
          ),
        ),
      
      
      ),
    );
  }
}
