import 'package:flutter/material.dart';
import 'dart:io';

class SendPhotoScreen extends StatefulWidget {
  SendPhotoScreen(this._image);
  final File _image;

  @override
  _SendPhotoScreenState createState() => _SendPhotoScreenState();
}

class _SendPhotoScreenState extends State<SendPhotoScreen> {
  TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CircleAvatar(
            backgroundImage: AssetImage("images/songnanli2.jpg"),
          ),
          actions: [
            IconButton(icon: Icon(Icons.crop_rotate_sharp), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.emoji_emotions_outlined), onPressed: () {}),
            IconButton(icon: Icon(Icons.text_fields), onPressed: () {}),
            IconButton(icon: Icon(Icons.edit), onPressed: () {}),
          ],
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 35),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop(_captionController.text);
            },
            backgroundColor: Color(0xFF128C7E),
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ),
        extendBody: true,
        backgroundColor: Color(0xFF202020),
        resizeToAvoidBottomInset: false,
        body: SizedBox.expand(
          child: Stack(
            // fit: StackFit.expand,
            children: [
              Center(
                child: Image.file(
                  widget._image,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Color(0xFF202020).withAlpha(135),
                  // height: 75,
                  constraints: BoxConstraints(maxHeight: 70, minHeight: 50),
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(Icons.add_to_photos),
                              onPressed: () {}),
                          Container(
                            height: 35,
                            // color: Colors.amber,
                            child: VerticalDivider(
                              thickness: 2,
                              endIndent: 10,
                              color: Colors.white54,
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(right: 75),
                            child: TextField(
                                controller: _captionController,
                                minLines: 1,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: "Add a caption...",
                                    border: InputBorder.none)),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                          Text("Me, Myself and I",
                              style: TextStyle(
                                color: Colors.grey,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
