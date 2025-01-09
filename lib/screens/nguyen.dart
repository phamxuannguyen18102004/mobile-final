import 'package:flutter/material.dart';

class NguyenScreen extends StatelessWidget {
  const NguyenScreen({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Di ngu thoi !'),
      ),
      body: Center(
        child: Text('ngu di be oi'),
      ),
    );
  }
}
