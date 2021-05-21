import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/SingleChat.dart';
import 'package:flutter/services.dart';

class TextMessageContainer extends StatefulWidget {
  TextMessageContainer(this._message, this._sent, this.chat, this._index);
  final SingleChat chat;
  final String _message;
  final bool _sent;
  final _index;
  @override
  _TextMessageContainerState createState() => _TextMessageContainerState();
}

class _TextMessageContainerState extends State<TextMessageContainer> {
  bool _isHighlighted = false;

  @override
  void initState() {
    super.initState();
    _isHighlighted = false;
  }

  @override
  Widget build(BuildContext context) {
    // print("Height: $minHeight Lines: $numLines");
    return Container(
      color: widget?.chat?.isHilightingMessages && _isHighlighted
          ? Colors.lightGreen[300].withAlpha(128)
          : Colors.transparent,
      child: GestureDetector(
        onTap: () {
          print("Tap on: ${widget._message} ${widget.chat}");
          if (!widget?.chat?.isHilightingMessages) return;
          print(
              "Tap on: ${widget?._index} ${widget?.chat?.startedHighlighting?._index}");
          setState(() {
            if (widget.chat?.startedHighlighting?._index == widget?._index) {
              widget.chat.startedHighlighting = null;
              widget.chat.isHilightingMessages = false;
              widget.chat.setChatState();
            }
            _isHighlighted = !_isHighlighted;
          });
        },
        onLongPress: () {
          setState(() {
            widget?.chat?.startedHighlighting = widget;
            widget?.chat?.isHilightingMessages = true;
            _isHighlighted = true;
          });
          HapticFeedback.vibrate();
        },
        child: Align(
          alignment:
              widget._sent ? Alignment.centerRight : Alignment.centerLeft,
          child: _messageBody(),
        ),
      ),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 10,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    // print("${widget._message} Size: ${textPainter.size}");
    return textPainter.size;
  }

  Widget _messageBody() {
    Size textSize = _textSize(widget._message, null);
    int numLines = ((textSize.width + 60) / 250.0).ceil();
    // double minHeight = textSize.height * numLines + 25;
    return Card(
      child: Container(
        width: textSize.width + 60,
        constraints: BoxConstraints(maxWidth: 250, minWidth: 70),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        // color: Colors.black54,
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            numLines > 1 ? Text(widget._message) : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                numLines == 1 ? Text(widget._message) : Container(),
                _messageTimestamp()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _messageTimestamp() {
    return Row(
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
    );
  }
}
