import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            //color: Colors.green,
            child: myWidget(),
          ),
        ),
      ),
    );
  }
}

// Widget myWidget() {
//   return Center(
//     child: Container(

//       color: Colors.red,
//       child: Text('Hola mundo'),
//     ),
//   );
// }

// Widget myWidget() {
//   return Column(
//     children: <Widget>[
//       Padding(
//         padding: EdgeInsets.fromLTRB(20.0, 10.0, 20, 40),
//         child: Text('data'),
//       ),
//       Padding(
//         padding: EdgeInsets.fromLTRB(300.0, 10.0, 0, 4),
//         child: Text('Hola'),
//       )
//     ],
//   );
// }

Widget myWidget() {
  return Column(
    children: <Widget>[
      RaisedButton(
        onPressed: null,
      )
    ],
  );
}
