import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "SharedPreferences",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter;

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('counter') ?? 0) + 1;
    });
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }

  getSave()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print("alınan kayıt: ${prefs.getInt('counter')}");
    setState(() {
      counter = (prefs.getInt('counter'));
    });
  }

  @override
  void initState() {
    getSave();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Text("gelen: $counter"),
            FlatButton(
              onPressed: (){
                save();
              },child: Text("değeri arttır ve sakla"),
            ),
            FlatButton(
              onPressed: (){
                getSave();
              },child: Text("değeri getir"),
            ),
          ],
        ),
      ),
    );
  }
}

