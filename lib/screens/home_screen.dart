// packages
import 'package:flutter/material.dart';
import 'package:writeai/data/data.dart';
import 'package:writeai/services/create_document.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isButtonPressed = false;

  final TextEditingController _titleController = TextEditingController();

  bool _isDocumentsListEmpty = documents.isEmpty;

  final int _maxDocuments = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // display documents

              // check if there are documents
              _isDocumentsListEmpty
                  // there aren't documents
                  ? const Text('Create a document with the button below')
                  // there are documents
                  : Expanded(
                      child: ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, index) {
                          return ElevatedButton(
                            child: Text(documents[index].title),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/editor',
                                arguments: documents[index],
                              );
                            },
                          );
                        },
                      ),
                    ),

              // check if button is pressed
              _isButtonPressed

                  // button is pressed
                  ? Column(
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(labelText: 'Title'),
                        ),
                        ElevatedButton(
                          child: const Text('Create'),
                          onPressed: () {
                            final String title = _titleController.text;

                            // create document
                            createDocument(title);

                            setState(() {
                              // update _isDocumentsListEmpty
                              _isDocumentsListEmpty = false;

                              // close button
                              _isButtonPressed = false;
                            });
                          },
                        ),
                      ],
                    )

                  // button is not pressed
                  :
                  // check if documents List is full
                  documents.length < _maxDocuments
                      // documents List is not full
                      ? ElevatedButton(
                          child: const Text('Create new document'),
                          onPressed: () =>
                              setState(() => _isButtonPressed = true),
                        )
                      // documents List is full
                      : const Text('You\'ve reached max documents'),
            ],
          ),
        ),
      ),
    );
  }
}
