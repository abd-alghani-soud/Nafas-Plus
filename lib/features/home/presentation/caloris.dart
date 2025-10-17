import 'package:flutter/material.dart';

class Caloris extends StatelessWidget {
  const Caloris({super.key});

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
          child: Text('Caloris',style: TextStyle(color: Colors.green,),
          ),
        ),),

    );
  }
}
