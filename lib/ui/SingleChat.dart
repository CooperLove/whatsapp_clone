import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/AdvancedSingleChat.dart';
import 'package:whatsapp_clone/ui/ChatPage.dart';

class SingleChat extends StatefulWidget {
  SingleChat(this.username);

  final String username;

  @override
  _SingleChatState createState() => _SingleChatState();
}

class _SingleChatState extends State<SingleChat> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SizedBox.expand(
        child: Image(
          image: AssetImage("images/Pirate.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: _bottomNavagationBar(),
        // height: 80,
        constraints: BoxConstraints(maxHeight: 90),
        color: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _appBar() {
    return AppBar(
      // automaticallyImplyLeading: false,
      leadingWidth: 70,
      leading: Container(
        alignment: Alignment.centerLeft,
        // color: Colors.amber,
        child: InkWell(
          onTap: () {
            print("Back");
            Navigator.pop(context);
          },
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Icon(Icons.arrow_back_rounded),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/songnanli2.jpg"),
                ),
              ],
            ),
          ),
        ),
      ),
      titleSpacing: 0.0,
      title: InkWell(
        onTap: () {
          print("Openning advanced info");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdvancedSingleChat()));
        },
        child: Container(
          height: kToolbarHeight - 5,
          // color: Colors.amberAccent,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.username),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
        IconButton(icon: Icon(Icons.call), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }

  Widget _bottomNavagationBar() {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                // constraints: BoxConstraints(minHeight: 45),
                // height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  shape: BoxShape.rectangle,
                  color: Colors.grey[850].withAlpha(200),
                ),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.insert_emoticon), onPressed: () {}),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.text,
                      controller: inputController,
                      maxLines: null,
                      onChanged: (text) {
                        // print('\n'.allMatches(text).length + 1);
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          hintText: "Type a message", border: InputBorder.none),
                    )),
                    IconButton(icon: Icon(Icons.attach_file), onPressed: () {}),
                    IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
                  ],
                ),
              )),
          // Expanded(
          // child:
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                shape: BoxShape.rectangle,
                color: Color(0xFF128C7E),
              ),
              child: IconButton(
                icon:
                    Icon(inputController.text.isEmpty ? Icons.mic : Icons.send),
                onPressed: () {
                  print("Enviando msg: [${inputController.text}]");
                },
              ),
            ),
          )
          // )
        ],
      ),
    );
  }
}
