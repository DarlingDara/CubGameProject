import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Alignment position1 = Alignment.topLeft;
  int pox = 1;
  int poy = 1;

  void changePosition(int newPox, int newPoy) {
    setState(() {
      newPox = newPox.clamp(1, 3);
      newPoy = newPoy.clamp(1, 3);

      position1 = Alignment(
        (newPox == 2) ? 0 : (newPox == 1) ? -1 : 1,
        (newPoy == 2) ? 0 : (newPoy == 1) ? -1 : 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.amberAccent,
                  width: double.infinity,
                  height: 300,
                  child: Align(
                    alignment: position1,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => changePosition(pox, --poy),
                  child: Text("вверх"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => changePosition(--pox, poy),
                      child: Text("влево"),
                    ),
                    ElevatedButton(
                      onPressed: () => changePosition(++pox, poy),
                      child: Text("вправо"),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => changePosition(pox, ++poy),
                  child: Text("вниз"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}