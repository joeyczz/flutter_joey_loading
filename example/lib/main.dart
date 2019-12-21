import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:joey_loading/joey_loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Example Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('loading 2 seconds'),
              onPressed: () {
                Loading.show(
                  context,
                  duration: const Duration(seconds: 2),
                  child: SpinKitCircle(
                    color: Colors.red,
                    size: 100,
                  ),
                );
              },
            ),
            FlatButton(
              child: Text('loading close self'),
              onPressed: () {
                Loading.show(context);
                Future.delayed(const Duration(seconds: 5), () {
                  Loading.dismiss();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
