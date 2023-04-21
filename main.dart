import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'MyCalculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget customButton(String buttonValue) {
    return OutlinedButton(
      child: Text(
    buttonValue,
    style: const TextStyle(fontSize: 30),
      ),
      onPressed: () => onButtonClicked(buttonValue),
    );
  }

  int firstNum = 0;
  int secondNumber = 0;
  String textToDisplay = "";
  String res = "";
  String operatorToPerform = "";
  String buttonValue = "";

  void onButtonClicked(String buttonValue) {
    if (buttonValue == "C") {
      textToDisplay = "";
      firstNum = 0;
      secondNumber = 0;
      res = "";
    } else if (buttonValue == "+" ||
        buttonValue == "-" ||
        buttonValue == "*" ||
        buttonValue == "*") {
      firstNum = int.parse(textToDisplay);
      res = "";
      operatorToPerform = buttonValue;
    } else if (buttonValue == "=") {
      secondNumber = int.parse(textToDisplay);
      if (operatorToPerform == "+") {
        res = (firstNum + secondNumber).toString();
      }
      if (operatorToPerform == "-") {
        res = (firstNum - secondNumber).toString();
      }
      if (operatorToPerform == "/") {
        res = (firstNum / secondNumber).toString();
      }
      if (operatorToPerform == "*") {
        res = (firstNum * secondNumber).toString();
      }
    } else {
      res = int.parse(textToDisplay + buttonValue).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MyCalculator"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 200),
                child: ListTile(
                  title: Text(
                    textToDisplay,
                    style: TextStyle(
                        fontSize: 25, backgroundColor: Colors.grey[500]),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.red),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: AspectRatio(
                aspectRatio: 1.95 / 2,
                child: GridView.count(
                  crossAxisCount: 4,
                  children: [
                    customButton("1"),
                    customButton("2"),
                    customButton("3"),
                    customButton("C"),
                    customButton("4"),
                    customButton("5"),
                    customButton("6"),
                    customButton("+"),
                    customButton("7"),
                    customButton("8"),
                    customButton("9"),
                    customButton("-"),
                    customButton("*"),
                    customButton("0"),
                    customButton("/"),
                    customButton("="),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
