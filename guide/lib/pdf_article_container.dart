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
      appBar: AppBar(
        title: Text(
          'SML Guide Article',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
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
}

