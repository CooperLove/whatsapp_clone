import 'package:flutter/material.dart';

class DisappearingMessagesPage extends StatefulWidget {
  DisappearingMessagesPage(this._disappearingMessages);
  final bool _disappearingMessages;

  @override
  _DisappearingMessagesPageState createState() =>
      _DisappearingMessagesPageState();
}

enum MessageState { turnedOn, turnedOff }

class _DisappearingMessagesPageState extends State<DisappearingMessagesPage> {
  MessageState _state = MessageState.turnedOff;

  @override
  void initState() {
    super.initState();
    _state = widget._disappearingMessages
        ? MessageState.turnedOn
        : MessageState.turnedOff;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(_state == MessageState.turnedOn);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Disappearing messages"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Icon(
                Icons.timelapse,
                size: 100,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(
                  "Turning on this setting will make new messages disappear from this " +
                      "chat after 7 days. Recipients can still save these messages elsewhere.",
                  style: TextStyle(fontSize: 16.5),
                )),
            Divider(height: 5, color: Colors.white54),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Disappearing messages",
                      style: TextStyle(fontSize: 16.5)),
                  ListTile(
                    title: const Text('On'),
                    leading: Radio<MessageState>(
                      value: MessageState.turnedOn,
                      groupValue: _state,
                      onChanged: (MessageState value) {
                        setState(() {
                          _state = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Off'),
                    leading: Radio<MessageState>(
                      value: MessageState.turnedOff,
                      groupValue: _state,
                      onChanged: (MessageState value) {
                        setState(() {
                          _state = value;
                        });
                      },
                    ),
                  ),
                  Text("Anyone in this chat can change this setting. $_state",
                      style: TextStyle(fontSize: 14.5, color: Colors.grey)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
