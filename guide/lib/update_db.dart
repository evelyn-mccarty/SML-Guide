//TODO: whyyyyyyyyyyyyyyyyyyy
//NOTE: this is pure proof of concept, it's not actually functional
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


void main() async {
  final headers = {
    'Content-Type': 'Application/json',
  };

  final params = {
    'Edition': '0',
    'Checked': '0',
  };

  final url = Uri.parse('https://jcbbrbn4l3.execute-api.us-east-2.amazonaws.com/default/ReturnGreaterX')
      .replace(queryParameters: params);

  final res = await http.post(url, headers: headers);
  final status = res.statusCode;
  if (status != 200) throw Exception('http.post error: statusCode= $status');

  final Map<String, dynamic> rawblob = jsonDecode(res.body);
  //print(rawblob);
  List<dynamic> articles = rawblob["response"]["Items"];
  //print(articles);
  articles.forEach((article) {
    writeData(article);
  });
}

Future<File> writeData(Map<String, dynamic> payload) async {
  Directory _appDocumentsDirectory = await getApplicationDocumentsDirectory();

  String appDocPath = _appDocumentsDirectory.path;
  final File file = File('${_appDocumentsDirectory.path}/${payload['title']}.json');
  return file.writeAsString(payload.toString());
  return file;
}


  // chunk data into objects based on scan count. every object is surrounded by {}, so use a regex to match that.
  // for each object, store it as a json file in document localstorage.
  // from there, we know that we have those objects in storage by looking at the documents folder itself