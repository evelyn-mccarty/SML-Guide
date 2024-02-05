import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

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

  final String path;
  final String title;

  @override
  State<PDFArticleContainer> createState() => _PDFArticleContainerState();
}

class _PDFArticleContainerState extends State<PDFArticleContainer> {
  
  late PdfControllerPinch pdfControllerPinch;

  String articleTitle = '';

  @override
  initState() {
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
          style: TextStyle(
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
    return AppBar(
        title: Text(widget.title),
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

