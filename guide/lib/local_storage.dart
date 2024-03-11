import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'main.dart';
part 'local_storage.g.dart';
//import 'package:path_provider/path_provider.dart';

/*
The actual widget here isn't /really/ the relevant portion, it's more the LocalStorage object itself.
That being said, this definitely needs more work.

In any case, provide a file path to the LocalStorage object, and it'll display tags + body in a rudimentary fashion.
Will need polish to advance to actual production, but still.
*/

void main() => runApp(
    MaterialApp(home: LocalStorage(fPath: 'assets/json/testArticle.json')));

//NOTE: technically, fPath can point anywhere, but i really should write a helper function to get it to pull from user Documents since that's what this is gonna be using most of the time...
//TODO: get path_provider working here so all that has to be provided is a local path instead of assets/whatever.
class LocalStorage extends StatefulWidget {
  LocalStorage({
    super.key,
    required this.fPath,
  }) {
    data = BaseArticleData(0, "never adjusted", "never adjusted", [], [], []);
  }

  final String fPath;
  late BaseArticleData data;
  String aTags = "";
  String aBody = "";
  String title = "never adjusted :)";

  Future<File> get _localFile async {
    return File(fPath);
  }

  Future<BaseArticleData> readArticle() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      final dataMap = jsonDecode(contents) as Map<String, dynamic>;
      data = BaseArticleData.fromJson(dataMap);

      return data;
    } catch (e) {
      debugPrint(e.toString());
      const contents =
          '{   "title" : "!!Test Article!!", "tags" : [ "English", "Healthcare"], "body" : [ "This is what an article body might look like, if it existed.", "And this is its second line."] }';
      final dataMap = jsonDecode(contents) as Map<String, dynamic>;
      data = BaseArticleData.fromJson(dataMap);
      return data;
    }
  }

  @override
  State<LocalStorage> createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    widget.readArticle().then((BaseArticleData result) {
      setState(() {
        loaded = true;
        widget.data = result;
        stderr.write(widget.data.title);

        widget.title = widget.data.title;
        for (String tag in widget.data.tags) {
          widget.aTags += "$tag, ";
        }
        for (String bodyLine in widget.data.body) {
          widget.aBody += "$bodyLine\n";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.defaultAppBar(widget.title),
      body: Column(
        children: [
          Text(widget.aTags),
          Text(widget.aBody),
        ],
      ),
    );
  }
}

@JsonSerializable()
class BaseArticleData {
  BaseArticleData(
      this.id, this.author, this.title, this.tags, this.body, this.formatting);

  String title;
  String author;
  int id;
  List<String> body = List.empty(growable: true);
  List<String> tags = List.empty(growable: true);
  List<String> formatting = List.empty(growable: true);

  factory BaseArticleData.fromJson(Map<String, dynamic> json) =>
      _$BaseArticleDataFromJson(json);
  Map<String, dynamic> toJson() => _$BaseArticleDataToJson(this);
}
