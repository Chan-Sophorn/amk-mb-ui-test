import 'package:flutter/material.dart';

class AmkHomeView extends StatelessWidget {
  const AmkHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          children: [
            Text("Home Screen"),
          ],
                ),
        ))
    );
  }
}