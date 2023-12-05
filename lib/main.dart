// Import the necessary packages.
import

'package:flutter/material.dart';

void main() => runApp(BMICalculatorApp());

class

BMICalculatorApp

    extends

    StatelessWidget

{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BMICalculator(),
    );
  }
}

class

BMICalculator

    extends

    StatefulWidget

{
  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class

_BMICalculatorState

    extends

    State<BMICalculator> {
  // Create variables to store the user's height, weight, and BMI value.
  double height = 170;
  double weight = 0;
  double bmi = 0;

  // Calculate the BMI value based on the user's height and weight.
  void calculateBMI() {
    setState(() {
      bmi = weight / (height * height / 10000);
    });
  }

  String groupValue = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text field for the user's name
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Fullname',
              ),
            ),
            // Text field for the user's height.
            TextField(
              decoration: InputDecoration(
                labelText: 'Height in cm; 170',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                height = double.parse(value);
              },
            ),
            // Text field for the user's weight.
            TextField(
              decoration: InputDecoration(
                labelText: 'Weight in KG',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                weight = double.parse(value);
              },
            ),
            // Button for male or female option
      Padding(
        padding: const EdgeInsets.only (left: 15),
            child: Row(
              children: [
                Radio(
                    value: "Male",
                    groupValue: groupValue,
                    onChanged: (value){
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                const Text("Male", style: TextStyle(
                    fontSize: 15, color: Colors.black, fontWeight:  FontWeight.normal),
                ),
                const SizedBox(width: 50,),
                Radio(
                    value: "Female",
                    groupValue: groupValue,
                    onChanged: (value){
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                const Text("Female", style: TextStyle(
                    fontSize: 15, color: Colors.black, fontWeight:  FontWeight.normal),
                ),
              ],
              ),
            ),

            // Button to calculate the BMI value.
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Calculate BMI and save'),
            ),

            // Text to display the calculated BMI value.
            Text('BMI Value: ${bmi.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
