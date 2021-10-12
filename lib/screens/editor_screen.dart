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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        foregroundColor: const Color(0xff000000),
        elevation: 0,
        centerTitle: true,
        title: Text(_document.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _document.body = _editorController.text;
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffD31788),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.cancel,
                color: Color(0xffffffff),
              ),
              onPressed: () {
                // delete

                _editorController.text = _lastTextBeforeCompletion;
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffD31788),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Color(0xffffffff),
              ),
              onPressed: () async {
                // regenerate

                _editorController.text = _lastTextBeforeCompletion;

                Uri url = Uri.parse(
                    'https://api.openai.com/v1/engines/davinci/completions');
                String prompt = _editorController.text;

                Response response = await sendOAIRequest(url, prompt);
                String responseText = response.choices[0]['text'];

                _editorController.text = _editorController.text + responseText;
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffD31788),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.create,
                color: Color(0xffffffff),
              ),
              onPressed: () async {
                // generate

                _lastTextBeforeCompletion = _editorController.text;

                Uri url = Uri.parse(
                  'https://api.openai.com/v1/engines/davinci/completions',
                );
                String prompt = _editorController.text;

                Response response = await sendOAIRequest(url, prompt);
                String responseText = response.choices[0]['text'];

                _editorController.text = _editorController.text + responseText;
              },
            ),
          ),
        ],
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
