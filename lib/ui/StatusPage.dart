import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [_chatItem(), _recentStatuses(), _viewedStatuses()],
      ),
    );
  }

  Widget _chatItem() {
    return Row(
      children: [
        _userPhoto(),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Status",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Tap to add status update",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _userPhoto() {
    return Container(
      height: 100,
      // color: Colors.amber,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("images/songnanli2.jpg"),
              radius: 35,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF128C7E),
                  ),
                  child: Icon(
                    Icons.plus_one,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _recentStatuses() {
    List contactsStatus = [1, 2, 3, 4];
    return contactsStatus.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Text(
                  "Recent updates",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              for (var _ in contactsStatus) _statusItem()
            ],
          )
        : Container();
  }

  Widget _viewedStatuses() {
    List contactsStatus = [1, 2];
    return contactsStatus.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 10.0),
                child: Text(
                  "Viewed updates",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              for (var _ in contactsStatus) _statusItem()
            ],
          )
        : Container();
  }

  Widget _statusItem() {
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
              Text(
                "upload time",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
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
              radius: 35,
            ),
          )
        ],
      ),
    );
  }
}
