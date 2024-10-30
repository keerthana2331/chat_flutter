import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two Screen Navigation',
      initialRoute: '/',
      routes: {
        '/': (context) => screen1(),
        '/screen2': (context) => screen2(),
      },
    );
  }
}

class screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome To Halodek'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/screen2');
            },
            child: const Text('Lets Get Started'),
          ),
        ));
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HALODEK'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('chat'),
            const Text('status'),
            const Text('calls'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('back to screen 1'),
            )
          ],
        ),
      ),
    );
  }
}
