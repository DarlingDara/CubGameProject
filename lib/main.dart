import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tes/positionChange_bloc.dart';
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PositionCubit(),
      child: MyHomePageContent(),
    );
  }
}

class MyHomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
            body: Column(children: [
              Expanded(
                flex: 5,
                child: Stack(children: [
                  Container(
                      color: Colors.amberAccent,
                      width: double.infinity,
                      // height: 300,
                      child: BlocBuilder<PositionCubit, CubePosition>(
                        builder: (context, position) => Align(
                          alignment: Alignment(position.x, position.y),

                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.teal,
                          ),
                        ),
                       )
                  )
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
                        BlocProvider.of<PositionCubit>(context).changePosition(0, -1);
                      },
                      child: Text("вверх"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<PositionCubit>(context).changePosition(-1, 0);
                          },
                          child: Text("влево"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<PositionCubit>(context).changePosition(1, 0);
                          },
                          child: Text("вправо"),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<PositionCubit>(context).changePosition(0, 1);
                      },
                      child: Text("вниз"),
                    ),
                  ],),
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
