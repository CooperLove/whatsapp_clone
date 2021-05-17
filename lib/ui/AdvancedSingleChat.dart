import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/ChatPage.dart';
import 'package:whatsapp_clone/ui/SingleChat.dart';

class AdvancedSingleChat extends StatefulWidget {
  @override
  _AdvancedSingleChatState createState() => _AdvancedSingleChatState();
}

class _AdvancedSingleChatState extends State<AdvancedSingleChat> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 225,
          // title: Text("Me, Myself and I"),
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Me, Myself and I"),
            background: Image.asset(
              "images/songnanli2.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          // Container(
          //   color: Colors.amber,
          //   height: 800,
          // )
          Column()
        ]))
      ],
    );
  }
}
