import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: bmi(),
    );
  }
}


class bmi extends StatefulWidget {
  @override
  State<bmi> createState() => _bmiState();
}

// ignore: camel_case_types
class _bmiState extends State<bmi> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double ? _result ;

  set myColor(MaterialColor myColor) {
     _result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("BMI Calculater"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                  radius: 95,
                  backgroundImage: AssetImage("assets/images/img.png"),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(75, 15, 75, 10),
                child: TextFormField(
                  controller: _heightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your Height";
                    } else if (value.length < 3) {
                      return "Please enter valid height in CM";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      labelText: ('Height in CENTIMETER  [CM]')),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(75, 10, 75, 10),
                child: TextFormField(
                  controller: _weightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your Weight";
                    } else if (value.length < 3) {
                      return "Please enter valid weight in CM";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.balance_outlined),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      labelText: ('Weight in KILOGRAMS [KG] ')),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: ()  {
                  double height = double.parse(_heightController.text) / 100;
                  double weight = double.parse(_weightController.text);
                  double heightSquare = height * height;
                  double result = weight / heightSquare;
                  setState(() {
                    _result =  result.roundToDouble();

                  });
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  _result == null ? "Enter Value" : "${_result}",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(65, 15, 0, 5),
                    child: Container(
                      height: 50,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      // child: Text('UnderWeight',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 5),
                    child: Container(
                      height: 50,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      // child: Text('Normal',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 5),
                    child: Container(
                      height: 50,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      //child: Text('OverWeight',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 5),
                    child: Container(
                      height: 50,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      // child: Text('Obese',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 5),
                    child: Container(
                      height: 50,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      // child: Text('ExtremelyObese',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                    ),
                  ),


                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('=> 0 to 18 Underweight',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w200),),
                  Text('=> 18 to 25 Normal',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w200),),
                  Text('=> 25 to 30 Overweight',style: TextStyle(color: Colors.yellow,fontSize: 20,fontWeight: FontWeight.w200),),
                  Text('=> 30 to 35 Obese',style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.w200),),
                  Text('=> Above 35 ExtremlyObese',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w200),),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}
