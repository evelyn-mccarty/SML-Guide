import 'package:flutter/material.dart';
import 'package:guide/pdf_article_container.dart';

void main() => runApp(MyApp());

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ReusableWidgets.defaultAppBar("Home Page"),
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
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 8.0),
                  Text(isSpanish ? 'Vivienda' : 'HOUSING',
                      style: TextStyle(fontSize: 16.0)),
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
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school),
                  SizedBox(width: 8.0),
                  Text(isSpanish ? 'Educación' : 'EDUCATION',
                      style: TextStyle(fontSize: 16.0)),
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
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.airplanemode_active),
                  SizedBox(width: 8.0),
                  Text(isSpanish ? 'Inmigración' : 'IMMIGRATION',
                      style: TextStyle(fontSize: 16.0)),
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
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(250.0, 60.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_hospital),
                  SizedBox(width: 8.0),
                  Text(isSpanish ? 'Cuidado de la salud' : 'HEALTHCARE',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.defaultAppBar("Housing Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Housing Page'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                debugPrint('Article saved for future use');
              },
              child: Text('Save for Later'),
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
            Text('This is the Education Page'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                debugPrint('Article saved for future use');
              },
              child: Text('Save for Later'),
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
            Text('This is the Immigration Page'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                debugPrint('Article saved for future use');
              },
              child: Text('Save for Later'),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthcarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthcare Page'),
        actions: [
          Builder(
            builder: (innerContext) => PopupMenuButton<String>(
              icon: Icon(Icons.settings), // Change the icon here
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
                  PopupMenuItem(
                    value: 'user_profile',
                    child: Text('User Profile'),
                  ),
                  PopupMenuItem(
                    value: 'about_section',
                    child: Text('About Section'),
                  ),
                  PopupMenuItem(
                    value: 'view_app_guide',
                    child: Text('View App Guide'),
                  ),
                  PopupMenuItem(
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
            Text('This is the Healthcare Page'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                debugPrint('Article saved for future use');
              },
              child: Text('Save for Later'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) { 
                  return PDFArticleContainer(
                    path: 'assets/pdf/FAQ_KingCountyUndocumented.pdf',
                    title: 'King County Health Insurance Enrollment Info');
                  }
                ));
              },
              child: Text('Demo Article'),
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

