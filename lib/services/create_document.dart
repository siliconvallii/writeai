// data
import 'package:writeai/data/data.dart';

class Document {
  String title;
  String body;

  Document({required this.title, required this.body});
}

void createDocument(title) {
  final Document newDoc = Document(title: title, body: '');

  documents.add(newDoc);
}
