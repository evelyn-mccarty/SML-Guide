import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guide/json_article.dart';
import 'package:guide/pdf_article_container.dart';

void main() => runApp(const MyApp());

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
      home: const MyHomePage(title: 'SML Home Page'),
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

  @override
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => HousingPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.home),
                  const SizedBox(width: 8.0),
                  Text(isSpanish ? 'Vivienda' : 'Housing',
                      style: const TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EducationPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.school),
                  const SizedBox(width: 8.0),
                  Text(isSpanish ? 'Educación' : 'Education',
                      style: const TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImmigrationPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.airplanemode_active),
                  const SizedBox(width: 8.0),
                  Text(isSpanish ? 'Inmigración' : 'Immigration',
                      style: const TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthcarePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.local_hospital),
                  const SizedBox(width: 8.0),
                  Text(isSpanish ? 'Cuidado de la salud' : 'Healthcare',
                      style: const TextStyle(fontSize: 16.0)),
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
              const Text('English'),
              Switch(
                value: isSpanish,
                onChanged: (value) {
                  setState(() {
                    isSpanish = value;
                  });
                },
              ),
              const Text('Español'),
            ],
          ),
        ),
      ),
    );
  }
}

class HousingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.defaultAppBar("Housing Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Housing Page'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                debugPrint('Article saved for future use');
              },
              child: const Text('Save for Later'),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.defaultAppBar("Education Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Education Page'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                debugPrint('Article saved for future use');
              },
              child: const Text('Save for Later'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImmigrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.defaultAppBar("Immigration Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Immigration Page'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                debugPrint('Article saved for future use');
              },
              child: const Text('Save for Later'),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthcarePage extends StatefulWidget {
  @override
  State<HealthcarePage> createState() => _HealthcarePageState();
}

class _HealthcarePageState extends State<HealthcarePage> {
  late Future<JsonArticle> articleFuture;

  @override
  void initState() {
    super.initState();
    articleFuture = getArticle(context);
  }

  static Future<JsonArticle> getArticle(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/json/testArticle.json');
    final body = json.decode(data);
    return JsonArticle.fromJson(body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthcare Page'),
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Healthcare Page'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                debugPrint('Article saved for future use');
              },
              child: const Text('Save for Later'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return PDFArticleContainer(
                      path: 'assets/pdf/FAQ_KingCountyUndocumented.pdf',
                      title: 'King County Health Insurance Enrollment Info');
                }));
              },
              child: const Text('Demo PDF Article'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FutureBuilder(
                            future: articleFuture,
                            builder: ((context, snapshot) {
                              if (snapshot.hasData) {
                                final article = snapshot.data!;
                                return JsonArticleContainer(article: article);
                              } else {
                                return const Text('No Data');
                              }
                            }))));
              },
              child: const Text('Demo JSON Article'),
            ),
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
        title: const Text('Settings'),
      ),
      body: const Center(
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
            icon: const Icon(Icons.settings),
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
