import 'package:flutter/material.dart';
import 'package:nafas/features/home/presentation/screens/calculate.dart';

class BmiPage extends StatefulWidget {
  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  double sliderValue = 0;

  ValueNotifier<bool> male = ValueNotifier(false);

  ValueNotifier<bool> feMale = ValueNotifier(false);

  ValueNotifier<double> slideValue = ValueNotifier(150);

  ValueNotifier<int> weight = ValueNotifier(40);

  ValueNotifier<int> age = ValueNotifier(18);
  late double bmi = 0;
  String status = '';

  void showBMIDialog() {
    double height = slideValue.value.toDouble();
    double w = weight.value.toDouble();

    bmi = w / ((height / 100) * (height / 100));

    if (bmi < 18.5) {
      status = 'Fit 💪';
    } else if (bmi < 25) {
      status = 'Normal 😊';
    } else if (bmi < 30) {
      status = 'Fat 😢';
    } else {
      status = 'Very Fat 😒';
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF010101);
    const Color secondColor = Color(0xFF010101);
    const Color primaryColor = Color(0xFF4cb050);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: ValueListenableBuilder(
                      builder: (context, value, Widget? child) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: value == true ? primaryColor : secondColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male, size: 80, color: Colors.white),
                              Text(
                                'Male',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      valueListenable: male,
                    ),
                    onTap: () {
                      male.value = !male.value;
                      male.value == true ? feMale.value = false : null;
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: ValueListenableBuilder(
                      valueListenable: feMale,
                      builder: (BuildContext context, value, Widget? child) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: value == true ? primaryColor : secondColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Icon(
                                Icons.female_outlined,
                                size: 80,
                                color: Colors.white,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      feMale.value = !feMale.value;
                      feMale.value == true ? male.value = false : null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ValueListenableBuilder(
              valueListenable: slideValue,
              builder: (context, value, child) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                        child: Text(
                          'Height',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        value.round().toString(),
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Slider(
                        value: value,
                        onChanged: (val) {
                          slideValue.value = val;
                        },
                        activeColor: primaryColor,
                        max: 230,
                        min: 150,
                        divisions: (230 - 150),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        ValueListenableBuilder(
                          builder: (context, val, child) {
                            return Text(
                              val.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            );
                          },
                          valueListenable: weight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                weight.value > 30 ? weight.value-- : null;
                              },
                              child: Icon(Icons.remove),
                              shape: CircleBorder(),
                              backgroundColor: Color(0xFF4cb050),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                weight.value < 150 ? weight.value++ : null;
                              },
                              shape: CircleBorder(),
                              child: Icon(Icons.add),
                              backgroundColor: Color(0xFF4cb050),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        ValueListenableBuilder(
                          valueListenable: age,
                          builder: (
                            BuildContext context,
                            value,
                            Widget? child,
                          ) {
                            return Text(
                              value.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                age.value > 5 ? age.value-- : null;
                              },
                              child: Icon(Icons.remove),
                              shape: CircleBorder(),
                              backgroundColor: Color(0xFF4cb050),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                age.value < 100 ? age.value++ : null;
                              },
                              shape: CircleBorder(),
                              child: Icon(Icons.add),
                              backgroundColor: Color(0xFF4cb050),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                showBMIDialog();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shadowColor: Colors.green,
                      elevation: 15,

                      backgroundColor: Colors.black,

                      title: Container(
                        width: 100,
                        height: 200,
                        child: Column(
                          children: [
                            Text(
                              'BMI=${bmi.toStringAsFixed(2)}\nStatus=$status',
                              
                            ),
                            SizedBox(
                              height:20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF4cb050),
                              ),
                                onPressed: (){




                                }, child:Text('Ok',style: TextStyle(fontSize: 25,color: Colors.white),))
                          ],
                        ),
                      ),
                    );
                  },
                );
              },

              child: Container(
                height: 250,
                width: 550,
                decoration: BoxDecoration(
                  color: Color(0xFF4cb050),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // backgroundColor: backgroundColor,
    );
  }
}
