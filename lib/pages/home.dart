import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 220,
              width: 320,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.freevector.com/uploads/vector/preview/3666/FreeVector-Water-Drop-background.jpg"),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
      body: Container(
        child: Text("This is HomePage"),
      ),
    );
  }
}
