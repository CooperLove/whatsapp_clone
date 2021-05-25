import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:whatsapp_clone/ui/SingleChat.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class TextMessageContainer extends StatefulWidget {
  TextMessageContainer(
      this._message, this._sent, this._repliedMessage, this.chat, this._index,
      {this.image, this.imageCaption});
  final SingleChat chat;
  final String _message;
  final File image;
  final String imageCaption;
  String get message => _message;
  final dynamic _repliedMessage;
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

    if (widget.image != null) {
      print("Tem imagem");
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("Height: $minHeight Lines: $numLines");
    return Container(
      color: widget?.chat?.isHilightingMessages && _isHighlighted
          ? Colors.lightGreen[300].withAlpha(128)
          : Colors.transparent,
      child: SwipeTo(
        onRightSwipe: () {
          print("Replying to ${widget._message}");
          widget.chat.isReplyingMessage = true;
          widget.chat.repliedMessage = widget;
        },
        child: _messageWidget(),
      ),
    );
  }

  Widget _messageWidget() {
    return GestureDetector(
      onTap: () {
        print("Tap on: ${widget._message} ${widget.chat}");
        if (widget.chat != null && !widget.chat.isHilightingMessages) return;
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
          widget.chat.setChatState();
        });
        HapticFeedback.vibrate();
      },
      child: Align(
        alignment: widget._sent ? Alignment.centerRight : Alignment.centerLeft,
        child: _messageBody(),
      ),
    );
  }

  Size _textSize(String text, TextStyle style,
      {double maxWidth = double.infinity}) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 3,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    // print("${widget._message} Size: ${textPainter.size}");
    return textPainter.size;
  }

  Widget _messageBody() {
    Size textSize = _textSize(widget._message, null);
    Size repliedSize = widget._repliedMessage is File
        ? Size(0, 0)
        : _textSize(widget._repliedMessage, null);
    int numLines = ((textSize.width + 60) / 250.0).ceil();
    // double minHeight = textSize.height * numLines + 25;
    return Card(
      color: widget._sent ? Color(0xFF054642) : Color(0xFF222C35),
      child: Container(
        width:
            widget._repliedMessage == null && widget._repliedMessage is String
                ? textSize.width + 60
                : (repliedSize.width + 60 > textSize.width + 60
                    ? repliedSize.width + 60
                    : textSize.width + 60),
        constraints: BoxConstraints(maxWidth: 250, minWidth: 70),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        // color: Colors.black54,
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _replyWidget(),
            SizedBox(
              height: 5,
            ),
            widget.image != null ? Image.file(widget.image) : Container(),
            widget.image != null && widget.imageCaption != null
                ? SizedBox(
                    height: 10,
                  )
                : Container(),
            widget.image != null && widget.imageCaption != null
                ? Text(widget.imageCaption)
                : Container(),
            // (numLines > 1 ? Text(widget._message) : Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                numLines == 1 ? Text(widget._message) : Container(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: _messageTimestamp(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _replyWidget() {
    return GestureDetector(
      onTap: () {
        print("Going to ${widget._repliedMessage}");
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: widget._repliedMessage == null
            ? 0
            : (widget._repliedMessage is File
                ? 55
                : (widget._repliedMessage.isEmpty
                    ? 0
                    : _textSize(widget._repliedMessage, null, maxWidth: 200)
                            .height +
                        8)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          shape: BoxShape.rectangle,
          color: Color(0xFF033C35),
          // color: Colors.grey[850].withAlpha(200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            VerticalDivider(width: 2, thickness: 3, color: Colors.purple[300]),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 7.5),
                child: widget._repliedMessage is File
                    ? Image.file(
                        widget._repliedMessage,
                        height: 55,
                        width: 55,
                      )
                    : Text(
                        widget._repliedMessage ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                      ),
              ),
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
