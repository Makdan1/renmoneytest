
import 'package:flutter/material.dart';
import 'package:renmoneytest/list_widget.dart';

class DataList extends StatefulWidget {
  const DataList({Key? key}) : super(key: key);


  @override
  State<DataList> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DataList> {



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Data List"),
      ),
      body: ListView(
    children: const [

      ListWidget(name: "Daniel",),
      ListWidget(name: "Daniel",),
      ListWidget(name: "Daniel",),

    ],
    )
    );
  }
}
