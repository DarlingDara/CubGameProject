import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: FirstSceen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final position1 = ValueNotifier<Alignment>(Alignment.topLeft);

  void changePosition(int newPox, int newPoy) {
    pox = newPox = newPox.clamp(1, 3);
    poy = newPoy = newPoy.clamp(1, 3);

    position1.value = Alignment(
      (newPox == 2) ? 0 : (newPox == 1) ? -1 : 1,
      (newPoy == 2) ? 0 : (newPoy == 1) ? -1 : 1,
    );
  }

  int pox = 1;
  int poy = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        flex: 5,
        child: Stack(children: [
          Container(
              color: Colors.amberAccent,
              width: double.infinity,
              // height: 300,
              child: ValueListenableBuilder(
                valueListenable: position1,
                builder: (context, value, child) => Align(
                  alignment: value,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.teal,
                  ),
                ),
              ))
        ]),
      ),
      Expanded(
        flex: 3,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  changePosition(pox, --poy);
                },
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
            ]),
      ),
      Expanded(
        flex: 1,
        child: FilledButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FirstSceen()),
            );
          },
          child: Text("Меню"),
        ),
      ),
    ]));
  }
}
class Message extends StatelessWidget{
  late final TextEditingController _Name;
  late final TextEditingController _SurName;

  Message({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    _Name = TextEditingController();
    _SurName = TextEditingController();
    return Scaffold(
      body:
          Column(
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FirstSceen()),
                  );
                },
                child: Text("Меню"),
              ),
              TextField(
                controller: _Name,
                decoration: InputDecoration(
                  labelText: 'Имя',
                ),
              ),
              TextField(
                controller: _SurName,
                decoration: InputDecoration(
                  labelText: 'Фамилия',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String enteredText = "Привет! "+_Name.text+ " "+_SurName.text;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Приветствие'),
                        content: Text(enteredText),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('ОК'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Показать введенный текст'),
              ),
            ],
          )

    );
  }
}
class FirstSceen extends StatelessWidget {
  const FirstSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        FilledButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          child: Text("Куб"),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Message()),
            );
          },
          child: Text("Поля"),
        ),
      ])
    ]));
  }
}
