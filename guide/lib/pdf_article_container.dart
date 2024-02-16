import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pdf_article_container.g.dart';

/*
EXAMPLE ON HOW TO BUILD THIS INTO A FUNCTION:

              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) { 
                  return PDFArticleContainer(
                    path: 'assets/pdf/FAQ_KingCountyUndocumented.pdf',
                    title: 'King County Health Insurance Enrollment Info');
                  }
                ));
*/

class PDFArticleContainer extends StatefulWidget {
  PDFArticleContainer({
    super.key,
    required this.path,
    required this.title,
  });

  final int id = 0;
  final String path;
  final String title;
  bool fav = false;

  @override
  State<PDFArticleContainer> createState() => _PDFArticleContainerState();
}

class _PDFArticleContainerState extends State<PDFArticleContainer> {
  
  late PdfControllerPinch pdfControllerPinch;

  String articleTitle = '';

  @override
  initState() {
    widget.fav = false;
    articleTitle = widget.title;
    String path = widget.path;
    super.initState();
    pdfControllerPinch = PdfControllerPinch(document: 
      PdfDocument.openAsset(path));

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
        Text(
          articleTitle,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black),
          ),
        _pdfView(),
      ],
    );
  }

  Widget _pdfView() {
    return Expanded(
      child: PdfViewPinch(
        controller: pdfControllerPinch,
      ),
    );
  }

  PreferredSizeWidget? _topBar() {
    bool favorited = false;
    return AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (innerContext) => IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                setState(() { favorited = !favorited; });
                debugPrint("saved article to cache (WIP)");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Article saved to cache"))
                );
              }
            )
          ),
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

// this is *largely* unnecessary, but was a good example
@JsonSerializable() 
class FileArticle {
  FileArticle(this.id, this.title, this.filename);

  int id;
  String title;
  String filename;

  factory FileArticle.fromJson(Map<String, dynamic> json) => _$FileArticleFromJson(json);
  Map<String, dynamic> toJson() => _$FileArticleToJson(this);

}
