import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ラン友',
      theme: ThemeData(
        primaryColor: Colors.blue.shade400,
        accentColor: Colors.red.shade200,
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'ラン友'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: size.width,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/running.jpg', fit: BoxFit.cover),
                ClipRRect(
                  // Clip it cleanly.
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Container(
                                height: size.width,
                                margin: EdgeInsets.only(left: 50, right: 50),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Column(
                                    children: [
                                      Text(
                                        'ラン友',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                      SpaceBox.height(40),
                                      SizedBox(
                                        width: 330,
                                        height: 60,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PrivacyPolicyPage(),
                                                ));
                                          },
                                          child: Text(
                                            "Privacy Policy",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                            ),
                                          ),
                                          style: ButtonStyle(),
                                        ),
                                      ),
                                      SpaceBox.height(20),
                                      SizedBox(
                                        width: 330,
                                        height: 60,
                                        child: ElevatedButton(
                                          child: Text(
                                            'Terms of Use',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PrivacyPolicyPage(),
                                                ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          /*
          Text(
            'You hany times:',
            style: TextStyle(
              color: Colors.blue.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),*/
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("次のページ"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
        child: Center(
          child: ElevatedButton(
            child: Text('戻る'),
            onPressed: () {
              // 1つ前に戻る
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class SpaceBox extends SizedBox {
  SpaceBox({double width = 8, double height = 8})
      : super(width: width, height: height);

  SpaceBox.width([double value = 8]) : super(width: value);
  SpaceBox.height([double value = 8]) : super(height: value);
}