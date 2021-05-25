import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/CallsPage.dart';
// import 'package:whatsapp_clone/ui/ChatList.dart';
import 'package:whatsapp_clone/ui/ChatPage.dart';
import 'package:whatsapp_clone/ui/StatusPage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(initialIndex: 1, length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: tabController.index != 2
            ? FloatingActionButton(
                backgroundColor: Color(0xFF128C7E),
                onPressed: () {},
                child: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: Color(0xFF128C7E),
                    mini: true,
                    onPressed: () {},
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xFF128C7E),
                    onPressed: () {},
                    child: Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: new Text("WhatsApp"),
                pinned: true,
                floating: true,

                actions: [
                  IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.more_vert),
                      iconSize: 30.0,
                      onPressed: () {}),
                ],
                // forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Container(
                      width: 20,
                      child: Tab(
                        icon: Icon(
                          Icons.camera_alt,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: Tab(text: "CHATS"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: Tab(text: "STATUS"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: Tab(text: "CALLS"),
                    ),
                  ],
                  controller: tabController,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [
              Center(
                child: Text("Camera page"),
              ),
              ChatPage(),
              StatusPage(),
              CallsPage(),
            ],
          ),
        ));
  }
}
