import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.children, required this.color})
      : super(key: key);
  final List<Widget> children;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}

List<Widget> tagGenerator(List<dynamic> tags) {
  List<Widget> ret = [];
  tags.forEach((element) {
    ret.add(Tag(color: Colors.grey, children: [Text(element)]));
    ret.add(SizedBox(
      width: 5,
    ));
  });
  return ret;
}

class JsonArticle {
  final String title;
  final String author;
  final List<dynamic> tags;
  final List<dynamic> body;

  const JsonArticle({
    required this.title,
    required this.author,
    required this.tags,
    required this.body,
  });

  static JsonArticle fromJson(json) => JsonArticle(
        title: json["Title"],
        author: json["Author"],
        tags: json["Tags"],
        body: json["Body"],
      );
}

class JsonArticleContainer extends StatefulWidget {
  const JsonArticleContainer({
    super.key,
    required this.article,
  });

  final JsonArticle article;

  @override
  State<JsonArticleContainer> createState() => _JsonArticleContainerState();
}

class _JsonArticleContainerState extends State<JsonArticleContainer> {
  String articleTitle = '';

  @override
  initState() {
    articleTitle = widget.article.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: _topBar(),
      body: _articleView(),
    );
  }

  //TODO: MAKE PRETTY
  Widget _articleView() {
    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 50.0,
          ),
          Row(children: tagGenerator(widget.article.tags)),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.article.title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            constraints: BoxConstraints(minHeight: 700),
            child: Column(children: [
              Row(
                children: [
                  Tag(color: Colors.black, children: [
                    Text(
                      widget.article.author,
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.article.body.join('\n'),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ]),
          ),
        ]),
      ],
    );
  }

  PreferredSizeWidget? _topBar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
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
    );
  }
}
