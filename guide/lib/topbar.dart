import 'package:flutter/material.dart';
import 'package:guide/pdf_article_container.dart';

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
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) { 
                  return PDFArticleContainer(
                    path: 'assets/pdf/FAQ_KingCountyUndocumented.pdf',
                    title: 'King County Health Insurance Enrollment Info');
                  }
                ));
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
                    /*
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
