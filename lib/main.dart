import 'package:flutter/material.dart';

void main() {
  runApp(Calc());
}

class Calc extends StatelessWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Real_Calci(),
    );
  }
}

class Real_Calci extends StatefulWidget {
  const Real_Calci({Key? key}) : super(key: key);

  @override
  State<Real_Calci> createState() => _Real_CalciState();
}

class _Real_CalciState extends State<Real_Calci> {
  TextEditingController firstno = TextEditingController();
  TextEditingController secno = TextEditingController();
  int sum = 0;
  int difference = 0;
  int m = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "SK CALCI",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 120,
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstno,
              keyboardType: TextInputType.number,
              cursorColor: Colors.yellow,
              decoration: InputDecoration(
                hintText: 'Enter ur 1st no',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: secno,
              keyboardType: TextInputType.number,
              cursorColor: Colors.yellow,
              decoration: InputDecoration(
                hintText: 'Enter 2nd no',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: Sum,
                  child: Text("process"),
                ),

                ElevatedButton(
                  onPressed: Diff,
                  child: Text("sub"),
                ),

                ElevatedButton(
                  onPressed: mul, 
                  child: Text("mult"),
                  ),

              ],
            ),

            SizedBox(height: 50),

          Padding(
  padding: EdgeInsets.all(50),
  child: Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.yellow,
      borderRadius: BorderRadius.circular(10), // Add rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3), // Add a subtle shadow for depth
        ),
      ],
    ),
    height: 100,
    width: 200,
    child: Text(
      '${getOutput()}',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Text color
      ),
    ),
  ),
),
    ],
  ),
      ),);
  }

  void Sum() {
    int firs = int.tryParse(firstno.text) ?? 0;
    int secn = int.tryParse(secno.text) ?? 0;
    setState(() {
      sum = firs + secn;
      difference = 0;
      m=0; 
    });
  }

  void Diff() {
    int firs = int.tryParse(firstno.text) ?? 0;
    int secn = int.tryParse(secno.text) ?? 0;
    setState(() {
      difference = firs - secn;
      sum = 0;
      m=0;
    });
  }

  void mul(){
    int firs = int.tryParse(firstno.text) ?? 0;
    int secn = int.tryParse(secno.text) ?? 0;
    setState(() {
      m = firs*secn;
      sum=0;
      difference=0;
    });
  }



  String getOutput() {
    if (sum != 0) {
      return '$sum';
    } else if (difference != 0) {
      return '$difference';
    } 
    else if(m!=0){
      return '$m';
    }
    
    else {
      return 'No operation performed yet.';
    }
  }
}
