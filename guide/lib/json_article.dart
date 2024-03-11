import 'package:flutter/material.dart';

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
        title: json["title"],
        author: json["author"],
        tags: json["tags"],
        body: json["body"],
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
      appBar: _topBar(),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        _articleView(),
        Text(widget.article.author),
        Text(widget.article.tags.join(','))
      ],
    );
  }

  //TODO: MAKE PRETTY
  Widget _articleView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.article.body.join('\n'),
        ),
      ),
    );
  }

  PreferredSizeWidget? _topBar() {
    return AppBar(
      title: Text(widget.article.title),
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
