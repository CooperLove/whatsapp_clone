import 'package:flutter/material.dart';
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
      leadingWidth: 22.5,
      title: Container(
        // color: Colors.amber,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/songnanli2.jpg"),
            ),
            Text(widget.username),
          ],
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
                      controller: inputController,
                      maxLines: null,
                      onChanged: (text) {
                        print('\n'.allMatches(text).length + 1);
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
                icon: Icon(Icons.mic),
                onPressed: () {},
              ),
            ),
          )
          // )
        ],
      ),
    );
  }
}
