import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Instagram",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.camera),
          color: Colors.white,
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.tv),
            color: Colors.white,
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.paperplane),
            color: Colors.white,
            onPressed: (){},
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            label: "Upload",
            icon: Icon(CupertinoIcons.plus_app),
          ),
          BottomNavigationBarItem(
            label: 'Likes',
            icon: Icon(CupertinoIcons.heart),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(CupertinoIcons.person_crop_circle),
          ),
        ],
      ),
    );
  }
}