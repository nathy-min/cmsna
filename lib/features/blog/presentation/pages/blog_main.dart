import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:cmsna/features/blog/presentation/bloc/blog_bloc/blog_bloc.dart';
import 'package:cmsna/features/blog/presentation/pages/blog_detail.dart';
import 'package:cmsna/features/home/presentation/widgets/blog_card.dart';
import 'package:cmsna/features/home/presentation/widgets/custom_navigation_bar.dart';
import 'package:cmsna/features/home/presentation/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    context.read<BlogBloc>().add(FetchBlogs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(initialIndex: 6),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_download), // Download Icon
            onPressed: () {
              // Download functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.delete), // Delete Icon
            onPressed: () {
              // Delete functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.email), // Email Icon
            onPressed: () {
              // Email functionality
            },
          ),
          PopupMenuButton<int>(
            itemBuilder: (context) => [],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is FetchBlogError) {
            return Center(
                child: Text(
              state.message,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ));
          }
          if (state is FetchBlogLoading) {
            return ShimmerWidget();
          }
          if (state is FetchBlogLoaded) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Daily Digest',
                        style: GoogleFonts.aBeeZee(
                            fontSize: 25.sp), // Increased font size
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        'Highlights',
                        style: GoogleFonts.actor(
                            // Replace with your unique font name
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.items.length,
                          itemBuilder: (context, index) {
                            BlogData item = state.items[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlogDetail(
                                              item: item,
                                            )));
                              },
                              child: BlogCard(
                                minutesToRead: item.minutesToRead.toString(),
                                time: item.createdAt,
                                user: item.user,
                                image: item.thumbnail,
                                title: item.title,
                                description: item.textContent,
                              ),
                            );
                          }),
                    )
                  ]),
            );
          }
          return Container();
        },
      ),
    );
  }
}
