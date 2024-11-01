import 'package:flutter/material.dart';

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HALODEK'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text('chat'),
            Text('status'),
            Text('calls'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
