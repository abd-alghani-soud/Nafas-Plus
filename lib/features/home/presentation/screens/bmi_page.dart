import 'package:flutter/material.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({super.key});

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
          child: Text('Bmi',style: TextStyle(color: Colors.green,),
          ),
        ),),

    );
  }
}
