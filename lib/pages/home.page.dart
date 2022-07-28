import 'package:flutter/material.dart';

class ContentHomePage extends StatefulWidget {
  const ContentHomePage({Key? key}) : super(key: key);

  @override
  State<ContentHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<ContentHomePage> {
  @override
  Widget build(BuildContext context) {return Scaffold(body: Column(children: const [Center(child: Text("data"))],),);
    
  }
}