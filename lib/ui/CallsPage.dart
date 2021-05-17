import 'package:flutter/material.dart';

class CallsPage extends StatefulWidget {
  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    List calls = [false, false, true, false, true];
    return SingleChildScrollView(
      child: Column(
        children: [for (var call in calls) _callItem(call, !call)],
      ),
    );
  }

  Widget _callItem(bool isVideocall, bool madeCall) {
    return Row(
      children: [
        _contactStatusPhoto(),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Username",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Icon(
                    madeCall ? Icons.call_made_sharp : Icons.call_received,
                    color: madeCall ? Color(0xFF075E54) : Colors.red[700],
                  ),
                  Text(
                    "upload time",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Align(
            child: Icon(
              isVideocall ? Icons.videocam : Icons.call,
              size: 32.5,
              color: Color(0xFF128C7E),
            ),
            alignment: Alignment.centerRight,
          ),
        ))
      ],
    );
  }

  Widget _contactStatusPhoto() {
    return Container(
      height: 80,
      // color: Colors.amber,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("images/songnanli2.jpg"),
              radius: 30,
            ),
          )
        ],
      ),
    );
  }
}
