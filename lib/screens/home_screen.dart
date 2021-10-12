// packages
import 'package:flutter/material.dart';
import 'package:writeai/data/data.dart';
import 'package:writeai/utils/create_document.dart';
import 'package:writeai/widgets/bottom_button.dart';

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
        foregroundColor: const Color(0xffffffff),
        backgroundColor: const Color(0xffD31788),
        elevation: 0,
        centerTitle: true,
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // display documents

              // check if there are documents
              _isDocumentsListEmpty
                  // there aren't documents
                  ? Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 100 * 2,
                      ),
                      child: const Text(
                        'There is no document here...'
                        '\ncreate one with the button below!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontFamily: 'Lato',
                          fontSize: 14,
                        ),
                      ),
                    )
                  // there are documents
                  : Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 100 * 2,
                        ),
                        child: ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/editor',
                                  arguments: documents[index],
                                );
                              },
                              child: Row(
                                children: [
                                  const Spacer(flex: 2),
                                  const Icon(Icons.text_snippet, size: 35),
                                  const Spacer(flex: 5),
                                  Expanded(
                                    flex: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          documents[index].title,
                                          style: const TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 21,
                                          ),
                                        ),
                                        Text(
                                          documents[index].date,
                                          style: const TextStyle(
                                            color: Color(0xff656565),
                                            fontFamily: 'Lato',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.forward, size: 30),
                                  const Spacer(flex: 5),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

              // check if button is pressed
              _isButtonPressed

                  // button is pressed
                  ? Container(
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 100 * 2,
                      ),
                      width: MediaQuery.of(context).size.width / 100 * 90,
                      color: const Color(0xffD31788),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height / 100 * 1,
                            ),
                            child: const Text(
                              'New Document',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 100 * 80,
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 100 * 3,
                            ),
                            color: const Color(0xffFFFFFF),
                            child: TextField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Title',
                                hintStyle: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 21,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 21,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height / 100 * 1,
                            ),
                            child: SizedBox(
                              width:
                                  MediaQuery.of(context).size.width / 100 * 80,
                              height:
                                  MediaQuery.of(context).size.height / 100 * 5,
                              child: ElevatedButton(
                                child: const Text(
                                  'Create Now',
                                  style: TextStyle(
                                    color: Color(0xff580A7A),
                                    fontFamily: 'Lato',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffFFFFFF),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  side: MaterialStateProperty.all(
                                    const BorderSide(
                                      width: 2,
                                      color: Color(0xff580A7A),
                                    ),
                                  ),
                                ),
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
                            ),
                          ),
                        ],
                      ),
                    )

                  // button is not pressed
                  :
                  // check if documents List is full
                  documents.length < _maxDocuments
                      // documents List is not full
                      ? Container(
                          margin: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).size.height / 100 * 2,
                          ),
                          child: BottomButton(
                            title: 'New Document',
                            onPressed: () =>
                                setState(() => _isButtonPressed = true),
                          ),
                        )
                      // documents List is full
                      : Container(
                          margin: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).size.height / 100 * 2,
                          ),
                          child: const Text(
                            'You reached the maximum amount of documents!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff666666),
                              fontFamily: 'Lato',
                              fontSize: 14,
                            ),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
