import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIContainer(
        children: ListView(
      children: const <Widget>[UITextView(text: 'Home screen')],
    ));
  }
}
