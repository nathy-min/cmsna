import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:cmsna/features/home/presentation/widgets/auther_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Comment {
  final String username;
  final String content;
  final int likes;
  final DateTime date;
  final List<String> replies;

  Comment({
    required this.username,
    required this.content,
    required this.likes,
    DateTime? date,
    List<String>? replies,
  })  : this.date = date ?? DateTime.now(),
        this.replies = replies ?? [];
}

class BlogDetail extends StatelessWidget {
  final BlogData item;
  BlogDetail({Key? key, required this.item}) : super(key: key);

  // Dummy comments data
  final List<Comment> comments = [
    Comment(
        username: 'User1',
        content: 'Great post!',
        likes: 10,
        date: DateTime.now()),
    Comment(
        username: 'User2',
        content: 'Very informative.',
        likes: 5,
        date: DateTime.now()),
    // Add more comments as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Icon(Icons.bookmark_add_outlined),
          SizedBox(
            width: 2.w,
          ),
          Icon(Icons.share),
          SizedBox(
            width: 2.w,
          ),
          Icon(Icons.menu),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              AutherListTile(
                  user: item.user,
                  time: item.createdAt,
                  minutesToRead: item.minutesToRead.toString()),
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(item.thumbnail))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.2.h),
                child: Text(
                  item.title,
                  style: GoogleFonts.roboto(
                      fontSize: 16.px, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 1.2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.2.h),
                child: Text(
                  item.textContent,
                  style: GoogleFonts.roboto(fontSize: 14.px),
                ),
              ),
              SizedBox(
                height: 1.2.h,
              ),
              Wrap(
                children: item.tags
                    .map((e) => Card(
                          color: Color.fromARGB(255, 220, 239,
                              255), // Very light green background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15.0), // Rounded borders
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                                8.0), // Padding for the text inside the card
                            child: Text(
                              e.name,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold), // Text color
                            ),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 1.2.h,
              ),
              Text(
                'Comments',
                style: GoogleFonts.roboto(
                    fontSize: 16.px, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(comments[index].username),
                    subtitle: Text(comments[index].content),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {
                            // Like functionality
                          },
                        ),
                        Text('${comments[index].likes}'),
                        IconButton(
                          icon: Icon(Icons.reply),
                          onPressed: () {
                            // Reply functionality
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Add a comment",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Submit comment functionality
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
