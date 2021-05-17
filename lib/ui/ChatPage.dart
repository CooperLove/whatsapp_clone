import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/SingleChat.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            // color: Colors.amberAccent,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 5,
                    thickness: 1,
                    indent: 85,
                    endIndent: 20,
                    color: Colors.grey[800],
                  );
                },
                itemCount: 15,
                itemBuilder: (_, index) {
                  return Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      _userPhoto(),
                      _chatButton(index),
                    ],
                  );
                }),
          ),
        )
      ],
    );
  }

  Widget _userPhoto() {
    return Container(
        width: 65,
        alignment: Alignment.center,
        height: 65,
        // color: Colors.amber,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("images/songnanli2.jpg"),
          radius: 45,
        ));
  }

  Widget _chatButton(int index) {
    return Expanded(
        child: ElevatedButton(
      onPressed: () {
        print("Opening chat with username $index");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SingleChat("username $index")));
      },
      child: Row(
        children: [_usernameAndFirstMessage(index), _timeAndChatOptions()],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
    ));
  }

  Widget _usernameAndFirstMessage(int index) {
    return Expanded(
        flex: 3,
        child: Container(
          height: 75,
          // color: Colors.amberAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Username $index",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "first msg dsad sad sa dsad sad sad",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              )
            ],
          ),
        ));
  }

  Widget _timeAndChatOptions() {
    return Expanded(
        child: Container(
      height: 70,
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              "12:15 PM",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          // Text("")
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.volume_off_rounded, color: Colors.grey),
                Icon(Icons.push_pin, color: Colors.grey)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
