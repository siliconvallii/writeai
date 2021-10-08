// data
import 'package:writeai/data/data.dart';

String formatDate() {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  return day.toString() + '/' + month.toString() + '/' + year.toString();
}

class Document {
  String title;
  String body;
  String date;

  Document({
    required this.title,
    required this.body,
    required this.date,
  });
}

void createDocument(title) {
  final Document newDoc = Document(title: title, body: '', date: formatDate());

  documents.add(newDoc);
}
