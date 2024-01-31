import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            tooltip: 'Go back',
            onPressed: () {

            },
        ),
        title: const Text('SML Guide'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () { 
              // TODO: IMPLEMENT FUNCTION
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('this would open the settings menu, if it existed')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.star_outline),
            tooltip: 'enter cache',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('User Cache'),
                    ),
                    /*c
                    TODO: IMPLEMENT
                    */
                    body: const Center(
                      child: Text(
                        'User cache goes here',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Article text here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
