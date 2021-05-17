import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/SingleItemChat.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return ChatItem();
  }
}
