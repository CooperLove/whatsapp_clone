import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/ChatPage.dart';
import 'package:whatsapp_clone/ui/SingleChat.dart';

class AdvancedSingleChat extends StatefulWidget {
  @override
  _AdvancedSingleChatState createState() => _AdvancedSingleChatState();
}

class _AdvancedSingleChatState extends State<AdvancedSingleChat> {
  bool _muteNotifications = false;

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
          actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _mediaCard(),
          _notificationsAndMidiaVisibilityCard(),
          _messageOptionsList(),
          _aboutAndPhoneNumber(),
          _comunicationOption("Block User", Icons.block),
          _comunicationOption("Report User", Icons.thumb_down),
          Container(
            height: 30,
          )
        ]))
      ],
    );
  }

  Widget _mediaCard() {
    return Card(
      color: Color(0xFF121C25),
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: 100,
        child: GestureDetector(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Media, links, and docs",
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: Color(0xFF09AA9A)),
                  ),
                  Row(
                    children: [
                      Text(
                        "474",
                        style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _notificationsAndMidiaVisibilityCard() {
    return Card(
      color: Color(0xFF121C25),
      child: Container(
        height: 155,
        margin: EdgeInsets.only(right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _text("Mute notifications", Color(0xFFCCD3D9)),
                Switch(
                    value: _muteNotifications,
                    onChanged: (value) {
                      setState(() {
                        _muteNotifications = value;
                      });
                    })
              ],
            ),
            Divider(
              height: 5,
              color: Colors.white54,
            ),
            _inkWell(_text("Custom notifications", Color(0xFFCCD3D9)), () {}),
            Divider(
              height: 5,
              color: Colors.white30,
            ),
            _inkWell(_text("Media visibility", Color(0xFFCCD3D9)), () {},
                height: 45)
          ],
        ),
      ),
    );
  }

  Widget _text(String text, Color color, {double size = 14}) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }

  Widget _inkWell(Widget child, Function onTap, {double height = 50}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: height,
        // color: Colors.amber,
        child: child,
      ),
    );
  }

  Widget _messageOptionsList() {
    return Card(
      color: Color(0xFF121C25),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _messageOptionItem(
                "Desappearing messages", "Off", Icons.timelapse_sharp),
            Divider(
              height: 5,
              color: Colors.white54,
            ),
            _messageOptionItem(
                "Encryption",
                "Messages and calls are end-to-end encrypted.\nTap to verify",
                Icons.lock),
          ],
        ),
      ),
    );
  }

  Widget _messageOptionItem(String label, String sublabel, IconData icon,
      {double labelSize = 14, double sublabelSize = 14}) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _text(label, Color(0xFFCCD3D9), size: labelSize),
              _text(sublabel, Colors.grey, size: sublabelSize),
            ],
          ),
          icon != null ? Icon(icon) : Container()
        ],
      ),
    );
  }

  Widget _aboutAndPhoneNumber() {
    return Card(
      color: Color(0xFF121C25),
      child: Container(
        height: 100,
        // color: Colors.amber[700],
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _messageOptionItem("Status text", "March 26, 2018", null,
                labelSize: 16.5),
            Divider(
              height: 5,
              color: Colors.white54,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _messageOptionItem("+55 9 8141-8311", "Mobile", null,
                      labelSize: 16.5),
                  Container(
                    // color: Colors.amber,
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.message,
                          size: 26,
                        ),
                        Icon(
                          Icons.call,
                          size: 26,
                        ),
                        Icon(
                          Icons.video_call,
                          size: 26,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _comunicationOption(String label, IconData icon) {
    return Card(
      color: Color(0xFF121C25),
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        onTap: () {},
        child: Container(
          height: 45,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Icon(
                icon,
                color: Color(0xFFF3687D),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: TextStyle(color: Color(0xFFF3687D)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
