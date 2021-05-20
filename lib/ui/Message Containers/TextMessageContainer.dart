import 'package:flutter/material.dart';

class TextMessageContainer extends StatefulWidget {
  TextMessageContainer(this._message, this._sent);
  final String _message;
  final bool _sent;
  @override
  _TextMessageContainerState createState() => _TextMessageContainerState();
}

class _TextMessageContainerState extends State<TextMessageContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget._sent ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        child: Container(
          width: 100,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          // color: Colors.black54,
          alignment: Alignment.bottomRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget._message),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(
                    children: [
                      Text(
                        "${DateTime.now().hour.toString()}:${DateTime.now().toUtc().minute.toString()}",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Icon(
                        Icons.check_rounded,
                        color: Colors.grey,
                        size: 20,
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
}
