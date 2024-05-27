import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guide/json_article.dart';
import 'package:guide/pdf_article_container.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() => runApp(MyApp());

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/articles.json');
}

Future<void> updateArticles() async {
  final file = await _localFile;
  try {
    final response = await http.get(Uri.parse(
        'https://hjk9v5kjg1.execute-api.us-east-2.amazonaws.com/Articles'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      file.writeAsString(response.body);
    }
  } on SocketException catch (_) {
    // If the server did not return a 200 OK response,
    // then assume no connection, procede with local data.
    print('No internet');
  }
}

Future<List<JsonArticle>> readArticles() async {
  final file = await _localFile;
  final contents = await file.readAsString();
  List<dynamic> test = jsonDecode(contents) as List<dynamic>;
  List<JsonArticle> articles = [];
  for (final element in test) {
    articles.add(JsonArticle.fromJson(element));
  }
  return articles;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SML Development',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: MyHomePage(title: 'SML Home Page'),
    );
  }
}

class ReusableWidgets {
  static AppBar defaultAppBar(String title) {
    return AppBar(
      title: Text(title),
      actions: [
        Builder(
          builder: (innerContext) => PopupMenuButton<String>(
            icon: const Icon(Icons.settings), // Change the icon here
            onSelected: (value) {
              // Handle the selected option
              switch (value) {
                case 'user_profile':
                  debugPrint('User Profile');
                  break;
                case 'about_section':
                  debugPrint('About Section');
                  break;
                case 'view_app_guide':
                  debugPrint('View App Guide');
                  break;
                case 'sml_whatsapp_channel':
                  debugPrint('Navigate to SML WhatsApp Channel');
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'user_profile',
                  child: Text('User Profile'),
                ),
                const PopupMenuItem(
                  value: 'about_section',
                  child: Text('About Section'),
                ),
                const PopupMenuItem(
                  value: 'view_app_guide',
                  child: Text('View App Guide'),
                ),
                const PopupMenuItem(
                  value: 'sml_whatsapp_channel',
                  child: Text('SML WhatsApp Channel'),
                ),
              ];
            },
          ),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSpanish = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<JsonArticle>> articles = readArticles();

  @override
  Widget build(BuildContext context) {
    updateArticles();
    return Scaffold(
      key: _scaffoldKey,
      appBar: ReusableWidgets.defaultAppBar(
          isSpanish ? "Página de inicio" : "Home Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HousingPage(
                            articles: articles,
                            isSpanish: isSpanish,
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 8.0),
                  Text(isSpanish ? 'Vivienda' : 'Housing',
                      style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EducationPage(
                            articles: articles,
                            isSpanish: isSpanish,
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school),
                  SizedBox(width: 8.0),
                  Text(isSpanish ? 'Educación' : 'Education',
                      style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImmigrationPage(
                            articles: articles,
                            isSpanish: isSpanish,
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.airplanemode_active),
                  SizedBox(width: 8.0),
                  Text(isSpanish ? 'Inmigración' : 'Immigration',
                      style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HealthcarePage(
                            articles: articles,
                            isSpanish: isSpanish,
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_hospital),
                  SizedBox(width: 8.0),
                  Text(isSpanish ? 'Cuidado de la salud' : 'Healthcare',
                      style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('English'),
              Switch(
                value: isSpanish,
                onChanged: (value) {
                  setState(() {
                    isSpanish = value;
                  });
                },
              ),
              Text('Español'),
            ],
          ),
        ),
      ),
    );
  }
}

class HousingPage extends StatelessWidget {
  final Future<List<JsonArticle>> articles;
  final bool isSpanish;

  const HousingPage({required this.articles, required this.isSpanish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.defaultAppBar(
          isSpanish ? "Página de vivienda" : "Housing Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder(
                future: articles,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading'));
                  }
                  List<JsonArticle> fin = [];
                  if (isSpanish) {
                    fin = snapshot.data!
                        .where(
                            (element) => element.tags.contains("Housing Tag"))
                        .where((element) => element.tags.contains("Spanish"))
                        .toList();
                  } else {
                    fin = snapshot.data!
                        .where(
                            (element) => element.tags.contains("Housing Tag"))
                        .toList();
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: fin.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(fin[index].title),
                        subtitle: Text(fin[index].author),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  JsonArticleContainer(article: fin[index])));
                        },
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  final Future<List<JsonArticle>> articles;
  final bool isSpanish;

  const EducationPage({required this.articles, required this.isSpanish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.defaultAppBar(
          isSpanish ? "Página de Educatión" : "Education Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder(
                future: articles,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading'));
                  }
                  List<JsonArticle> fin = [];
                  if (isSpanish) {
                    fin = snapshot.data!
                        .where(
                            (element) => element.tags.contains("Education Tag"))
                        .where((element) => element.tags.contains("Spanish"))
                        .toList();
                  } else {
                    fin = snapshot.data!
                        .where(
                            (element) => element.tags.contains("Education Tag"))
                        .toList();
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: fin.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(fin[index].title),
                        subtitle: Text(fin[index].author),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  JsonArticleContainer(article: fin[index])));
                        },
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class ImmigrationPage extends StatelessWidget {
  final Future<List<JsonArticle>> articles;
  final bool isSpanish;

  const ImmigrationPage({required this.articles, required this.isSpanish});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.defaultAppBar(
          isSpanish ? "Página de Inmigración" : "Immigration Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder(
                future: articles,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading'));
                  }
                  List<JsonArticle> fin = [];
                  if (isSpanish) {
                    fin = snapshot.data!
                        .where((element) =>
                            element.tags.contains("Immigration Tag"))
                        .where((element) => element.tags.contains("Spanish"))
                        .toList();
                  } else {
                    fin = snapshot.data!
                        .where((element) =>
                            element.tags.contains("Immigration Tag"))
                        .toList();
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: fin.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(fin[index].title),
                        subtitle: Text(fin[index].author),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  JsonArticleContainer(article: fin[index])));
                        },
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class HealthcarePage extends StatelessWidget {
  final Future<List<JsonArticle>> articles;
  final bool isSpanish;

  const HealthcarePage({required this.articles, required this.isSpanish});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.defaultAppBar(
          isSpanish ? "Página de Salud" : "Healthcare Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder(
                future: articles,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading'));
                  }
                  List<JsonArticle> fin = [];
                  if (isSpanish) {
                    fin = snapshot.data!
                        .where((element) =>
                            element.tags.contains("Healthcare Tag"))
                        .where((element) => element.tags.contains("Spanish"))
                        .toList();
                  } else {
                    fin = snapshot.data!
                        .where((element) =>
                            element.tags.contains("Healthcare Tag"))
                        .toList();
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: fin.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(fin[index].title),
                        subtitle: Text(fin[index].author),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  JsonArticleContainer(article: fin[index])));
                        },
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Settings Page'),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext? context;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final String title;

  const MyAppBar({this.context, this.scaffoldKey, required this.title});

  @override
  Widget build(BuildContext context) {
    if (scaffoldKey != null) {
      // Used in MyHomePage
      return AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              scaffoldKey?.currentState?.openDrawer();
            },
          ),
        ],
        automaticallyImplyLeading: false,
      );
    } else {
      // Used in other pages
      return AppBar(
        title: Text(title),
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
