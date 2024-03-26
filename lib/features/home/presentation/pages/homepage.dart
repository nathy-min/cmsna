import 'package:cmsna/core/network/network_manager.dart';
import 'package:cmsna/core/network/utils/constants.dart';
import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:cmsna/features/blog/presentation/bloc/blog_bloc/blog_bloc.dart';

import 'package:cmsna/features/blog/presentation/pages/blog_detail.dart';
import 'package:cmsna/features/blog/presentation/pages/blog_main.dart';
import 'package:cmsna/features/home/presentation/widgets/blog_card.dart';
import 'package:cmsna/features/home/presentation/widgets/custom_navigation_bar.dart';
import 'package:cmsna/features/home/presentation/widgets/shimmer_widget.dart';
import 'package:cmsna/features/stock/presentation/pages/stock_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/menu_bloc.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<MenuBloc>().add(FetchMenu());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.2.h,
                    ),
                    Text(
                      'Hey, There 👋',
                      style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.px),
                    ),
                    Text(
                      'Welcome back',
                      style: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.px),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Let\'s get you started',
                      style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.px),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocBuilder<MenuBloc, MenuState>(
                      builder: (context, state) {
                        if (state is FetchMenuError) {
                          return ShimmerWidget();
                        } else if (state is FetchMenuLoaded) {
                          return GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(10),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  3, // This will make the grid have 3 items in a row
                              // childAspectRatio: 3 / 2,
                              // crossAxisSpacing: 10,
                              // mainAxisSpacing: 10,
                            ),
                            itemCount: state.items.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    context.read<BlogBloc>().add(FetchBlogs());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BlogPage()));
                                  } else if (index == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StockPage()));
                                  }
                                },
                                child: MenuCard(
                                  imageUrl: state.items[index].image,
                                  title: state.items[index].name,
                                ),
                              );
                            },
                          );
                        } else {
                          return Text('Error loading menu');
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w, bottom: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 6.5.h,
            width: 18.5.w,
            child: Center(
              child: title == 'Blog'
                  ? Icon(Icons.article, color: Colors.black, size: 30.0.px)
                  : title == 'Stock'
                      ? Icon(Icons.show_chart,
                          color: const Color.fromARGB(255, 230, 45, 45),
                          size: 30.0.px)
                      : Image.asset(imageUrl, fit: BoxFit.cover),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 236, 235, 235),
                borderRadius: BorderRadius.circular(10)),
          ),
          ...title.split(' ').map((word) => Center(child: Text(word))).toList(),
        ],
      ),
    );
  }
}

class BlogDisplay extends StatelessWidget {
  const BlogDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            return ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
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
                });
          }
          return Container();
        },
      ),
    );
  }
}
