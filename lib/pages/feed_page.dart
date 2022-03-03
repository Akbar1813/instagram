import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/models/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List <Story> _stories = [
    Story('assets/images/user_2.jpeg', 'Ann Katrin'),
    Story('assets/images/user_1.jpeg', 'User'),
    Story('assets/images/user_3.jpeg', 'User'),
    Story('assets/images/user_1.jpeg', 'User'),
    Story('assets/images/user_2.jpeg', 'User'),
    Story('assets/images/user_3.jpeg', 'User'),
  ];
  List <Post> _posts = [
    Post(
      userName: 'Alan Johnson',
      userImage: 'assets/images/user_1.jpeg',
      postImage: 'assets/images/feed_1.jpeg',
      caption: 'Always happy posts',
    ),
    Post(
      userName: 'Kettie',
      userImage: 'assets/images/user_3.jpeg',
      postImage: 'assets/images/feed_3.jpeg',
      caption: 'Always happy posts',
    ),
    Post(
      userName: 'Ann Katrin',
      userImage: 'assets/images/user_2.jpeg',
      postImage: 'assets/images/feed_2.jpeg',
      caption: 'Always happy posts',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              // #stories
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stories",style: TextStyle(color: Colors.white,fontSize: 14),),
                    Text("Watch all",style: TextStyle(color: Colors.white,fontSize: 14)),
                  ],
                ),
              ),
              // #storyList
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story){
                    return _itemOfStory(story);
                  }).toList(),
                ),
              ),
              // #postList
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i){
                    return _itemOfPost(_posts[i]);
                  }
                ),
              )

            ],
          ),
        ),
      )
    );
  }
  Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Colors.purple,
            )
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name,style: TextStyle(color: Colors.white),),
      ],
    );
  }
  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          // #header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.postImage!),
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.userName!,style: TextStyle(color: Colors.white),),
                  ],
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.ellipsis),
                  color: Colors.white,
                  onPressed: (){},
                )
              ],
            )
          ),
          // #post
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.userImage!),
            placeholder: AssetImage('assets/images/placeholder.png'),
          ),
          // #like
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.heart),
                    color: Colors.white,
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(CupertinoIcons.chat_bubble),
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
              IconButton(
                icon: Icon(CupertinoIcons.bookmark),
                color: Colors.white,
                onPressed: (){},
              )
            ],
          ),
          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Liked by ',
                    style: TextStyle(color: Colors.white)
                  ),
                  TextSpan(
                    text: "Sigmund,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Yessenia,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Dayana",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ]
              ),
            ),
          ),
          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 5,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.userName!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " ${post.caption}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // #post date
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              "Febuary 2020",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
