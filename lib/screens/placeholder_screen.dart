import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Text("This screen is a placeholder. \n" + 
      "This means it's here for testing purposes and will be removed " +
      "or replaced by a normal screen." ),
    );
  }

}