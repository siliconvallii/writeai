import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:writeai/providers/openai_api/send_oai_request.dart';
import 'package:writeai/utils/create_document.dart';

class EditorScreen extends StatelessWidget {
  EditorScreen({Key? key}) : super(key: key);

  final TextEditingController _editorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Document _document =
        ModalRoute.of(context)!.settings.arguments as Document;

    _editorController.text = _document.body;

    String _lastTextBeforeCompletion = '';

    void _handleBottomBar(int index) async {
      if (index == 0) {
        _editorController.text = _lastTextBeforeCompletion;
      } else if (index == 1) {
        _editorController.text = _lastTextBeforeCompletion;

        Uri url =
            Uri.parse('https://api.openai.com/v1/engines/davinci/completions');
        String prompt = _editorController.text;

        Response response = await sendOAIRequest(url, prompt);
        String responseText = response.choices[0]['text'];

        _editorController.text = _editorController.text + responseText;
      } else if (index == 2) {
        _lastTextBeforeCompletion = _editorController.text;

        Uri url =
            Uri.parse('https://api.openai.com/v1/engines/davinci/completions');
        String prompt = _editorController.text;

        Response response = await sendOAIRequest(url, prompt);
        String responseText = response.choices[0]['text'];

        _editorController.text = _editorController.text + responseText;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _document.body = _editorController.text;
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: 'Delete',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'Regenerate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Generate',
          ),
        ],
        onTap: _handleBottomBar,
      ),
      body: SafeArea(
        child: Center(
          child: TextField(
            controller: _editorController,
            keyboardType: TextInputType.multiline,
            minLines: 40,
            maxLines: null,
          ),
        ),
      ),
    );
  }
}
