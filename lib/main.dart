import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorWidget(),
    );
  }
}

class CalculatorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalculatorWidget();
}

class _CalculatorWidget extends State<CalculatorWidget> {
  List<FaIcon> iconos = [
    FaIcon(FontAwesomeIcons.plus),
    FaIcon(FontAwesomeIcons.minus),
    FaIcon(FontAwesomeIcons.divide),
    FaIcon(FontAwesomeIcons.asterisk)
  ];
  double firstNumber = 0;
  double secondNumber = 0;
  var resultString = "Result: 0";

  double sumar() {
    var result = firstNumber + secondNumber;

    return result;
  }
  double restar() {
    var result = firstNumber - secondNumber;

    return result;
  }
  double multiplicar() {
    var result = firstNumber * secondNumber;

    return result;
  }
  double dividir() {
    if (secondNumber == 0) {
      return null;
    }

    var result = firstNumber / secondNumber;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter first number',
                ),
                onChanged: (text) {
                  firstNumber = double.parse(text) ?? 0;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter second number',
                ),
                onChanged: (text) {
                  secondNumber = double.parse(text) ?? 0;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Text(
                resultString,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: iconos[0],
                  onPressed: () {
                    setState(() {
                      var result = sumar();
                      resultString = "Result: $result";
                    });
                  }
                ),
                IconButton(
                    icon: iconos[1],
                    onPressed: () {
                      setState(() {
                        var result = restar();
                        resultString = "Result: $result";
                      });
                    }
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: iconos[2],
                    onPressed: () {
                      setState(() {
                        var result = dividir();
                        resultString = result == null ? "ERROR" : "Result: $result";
                      });
                    }
                ),
                IconButton(
                    icon: iconos[3],
                    onPressed: () {
                      setState(() {
                        var result = multiplicar();
                        resultString = "Result: $result";
                      });
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
