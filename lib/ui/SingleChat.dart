import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/AdvancedSingleChat.dart';
import 'package:whatsapp_clone/ui/Message%20Containers/TextMessageContainer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SingleChat extends StatefulWidget {
  SingleChat(this.username);

  final String username;
  _SingleChatState _state;

  void setChatState() => _state.setInternalState();

  set isHilightingMessages(bool value) => _state?._isHilightingMessages = value;
  bool get isHilightingMessages =>
      _state == null ? false : _state._isHilightingMessages;

  set startedHighlighting(TextMessageContainer value) =>
      _state?.startedHighlighting = value;
  TextMessageContainer get startedHighlighting => _state?.startedHighlighting;

  set isReplyingMessage(bool value) => _state?._isReplyingMessage(value);
  bool get isReplyingMessage => _state?.isReplyingMessage;

  set repliedMessage(TextMessageContainer message) =>
      _state?._repliedMessage(message);

  @override
  _SingleChatState createState() => _SingleChatState();
}

class _SingleChatState extends State<SingleChat> {
  TextEditingController inputController = TextEditingController();
  List messages = [];
  ScrollController chatScrollControler = ScrollController();
  TextMessageContainer startedHighlighting;
  bool _isHilightingMessages = false;
  bool isReplyingMessage = false;
  TextMessageContainer repliedMessage;

  void _isReplyingMessage(bool value) {
    setState(() {
      isReplyingMessage = value;
    });
  }

  void _repliedMessage(TextMessageContainer message) {
    setState(() {
      repliedMessage = message;
    });
  }

  void setInternalState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget._state = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage("images/Pirate.jpg"),
              fit: BoxFit.fill,
            ),
            _chatContainer2(),
          ],
        ),
      ),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: _bottomNavagationBar(),
        height: !isReplyingMessage
            ? 65.0 +
                (inputController.text.isNotEmpty
                    ? _textSize(inputController.text, null).height - 16
                    : 0)
            : null,
        constraints: BoxConstraints(maxHeight: 180, minHeight: 65),
        color: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _appBar() {
    return AppBar(
      // automaticallyImplyLeading: false,
      leadingWidth: 70,
      leading: Container(
        alignment: Alignment.centerLeft,
        // color: Colors.amber,
        child: InkWell(
          onTap: () {
            print("Back");
            Navigator.pop(context);
          },
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Icon(Icons.arrow_back_rounded),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/songnanli2.jpg"),
                ),
              ],
            ),
          ),
        ),
      ),
      titleSpacing: 0.0,
      title: InkWell(
        onTap: () {
          print("Openning advanced info");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdvancedSingleChat()));
        },
        child: Container(
          height: kToolbarHeight - 5,
          // color: Colors.amberAccent,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.username),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
        IconButton(icon: Icon(Icons.call), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }

  Widget _chatContainer2() {
    return ListView.separated(
        padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom) +
            EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 60 +
                    (isReplyingMessage
                        ? 65.0 +
                            (_textSize(inputController.text, null).height - 16)
                        : 0.0)),
        separatorBuilder: (context, index) => SizedBox(
              height: 5,
            ),
        reverse: true,
        controller: chatScrollControler,
        itemCount: messages.length,
        // itemExtent: 25,
        itemBuilder: (context, index) {
          if (messages.length > 0) {
            Map d = messages[(messages.length - 1) - index];
            print(
                "$index is ${messages[index] is File ? "File" : "Text"} ${d.keys.first}");
            return TextMessageContainer(d.keys.first.toString(), index.isEven,
                d.values.first, widget, (messages.length - 1) - index);
          }
        });
  }

  Widget _bottomNavagationBar() {
    return Container(
      // height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: isReplyingMessage
            ? [_replyContainer(), _bottomBarBody()]
            : [
                _bottomBarBody(),
              ],
      ),
    );
  }

  Widget _bottomBarBody() {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                // constraints: BoxConstraints(minHeight: 45),
                // height: 45,
                decoration: BoxDecoration(
                  borderRadius: isReplyingMessage
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))
                      : BorderRadius.all(Radius.circular(20.0)),
                  shape: BoxShape.rectangle,
                  color: Colors.grey[850].withAlpha(200),
                ),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.insert_emoticon), onPressed: () {}),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.multiline,
                      controller: inputController,
                      minLines: 1,
                      maxLines: 3,
                      onChanged: (text) {
                        print(
                            "${_textSize(text, null)} ${text.trim().isEmpty}");
                        setState(() {
                          _isHilightingMessages = false;
                        });
                      },
                      // onSubmitted: (text) {
                      //   messages.add(text);
                      // },
                      decoration: InputDecoration(
                          hintText: "Type a message", border: InputBorder.none),
                    )),
                    IconButton(icon: Icon(Icons.attach_file), onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          final PickedFile imgFile = await picker.getImage(
                              source: ImageSource.gallery);

                          if (imgFile == null) return;
                          File file = File(imgFile.path);
                          bool fileExist = file.existsSync();
                          messages.add({file: null});
                          if (!fileExist) return;
                        }),
                  ],
                ),
              )),
          _sendMessageButton()
        ],
      ),
    );
  }

  Widget _replyContainer() {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(left: 5, right: 55),
      height: repliedMessage != null
          ? (_textSize(repliedMessage.message, null).height + 45).clamp(45, 95)
          : 45,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        shape: BoxShape.rectangle,
        color: Colors.grey[800].withAlpha(150),
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(left: 10, bottom: 5, top: 7.5, right: 7.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          // border: Border(
          //     left: BorderSide(color: Colors.purple[300], width: 2,)),
          color: Colors.grey[900].withOpacity(0.75),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            VerticalDivider(
                width: 5,
                thickness: 4,
                // indent: 7.5,
                // endIndent: 7.5,
                color: Colors.purple[300]),
            Expanded(
              flex: 3,
              child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(color: Colors.purple[300]),
                      ),
                      Text(
                        repliedMessage.message ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(Icons.close),
                      iconSize: 16,
                      onPressed: () {
                        setState(() {
                          isReplyingMessage = false;
                          repliedMessage = null;
                        });
                      },
                      color: Colors.grey,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _sendMessageButton() {
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          shape: BoxShape.rectangle,
          color: Color(0xFF128C7E),
        ),
        child: IconButton(
          icon: Icon(inputController.text.isEmpty ? Icons.mic : Icons.send),
          onPressed: () {
            setState(() {
              repliedMessage = null;
              isReplyingMessage = false;
            });

            if (inputController.text.trim().isEmpty) {
              inputController.text = "";
              return;
            }

            print("Enviando msg: [${inputController.text}]");
            setState(() {
              Map<String, dynamic> d = {
                inputController.text: repliedMessage?.message ?? null
              };
              messages.add(d);
              chatScrollControler
                  .jumpTo(chatScrollControler.position.minScrollExtent);
              inputController.text = "";
            });
          },
        ),
      ),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 3,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: 150);
    // print("${widget._message} Size: ${textPainter.size}");
    return textPainter.size;
  }
}
