import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.amber),
      color: Colors.blue,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  MySnakBar(message, context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  MyAlertDialog(context) {
    return showDialog(context: context,
        builder: (BuildContext context){
          return Expanded(child: AlertDialog(
            title: Text("Alert !"),
            content: Text("Do You Want To Delete "),
            actions: [
              TextButton(onPressed: (){
                MySnakBar("Success", context);
                Navigator.of(context).pop();
              }, child: Text("Yes")),
              TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No"))
            ],
          )
          );

        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          centerTitle: true,
          toolbarHeight: 60,
          elevation: 50,
          backgroundColor: Colors.amber,
          actions: [
            IconButton(
              onPressed: () {
                MySnakBar("I am message", context);
              },
              icon: Icon(Icons.comment),
            ),
            IconButton(
              onPressed: () {
                MySnakBar("I am search", context);
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                MySnakBar("I am Setting", context);
              },
              icon: Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () {
                MySnakBar("I am Email", context);
              },
              icon: Icon(Icons.email),
            ),
          ],
        ),

        body:Center(
            child: ElevatedButton(onPressed: (){MyAlertDialog(context);}, child: Text("Click me"),)

        )

    );
  }
}
