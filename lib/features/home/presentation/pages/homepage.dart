import 'package:cmsna/core/network/network_manager.dart';
import 'package:cmsna/core/network/utils/constants.dart';
import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:cmsna/features/blog/presentation/bloc/blog_bloc/blog_bloc.dart';

import 'package:cmsna/features/blog/presentation/pages/blog_detail.dart';
import 'package:cmsna/features/blog/presentation/pages/blog_main.dart';
import 'package:cmsna/features/home/presentation/widgets/blog_card.dart';
import 'package:cmsna/features/home/presentation/widgets/shimmer_widget.dart';
import 'package:cmsna/features/stock/presentation/pages/stock_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Text(
                    'Hey, There',
                    style: GoogleFonts.roboto(
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
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.px),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Wrap(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<BlogBloc>().add(FetchBlogs());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlogPage()));
                        },
                        child: MenuCard(
                          icon: FontAwesomeIcons.blog,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StockPage()));
                          },
                          child: MenuCard(icon: FontAwesomeIcons.chartLine)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.ad)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.amazonPay)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.chartLine)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.ad)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.amazonPay)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.chartLine)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.ad)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.amazonPay)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.chartLine)),
                      GestureDetector(
                          onTap: () {},
                          child: MenuCard(icon: FontAwesomeIcons.ad)),
                    ],
                  ),
                ],
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
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w, bottom: 5.4.h),
      child: Column(
        children: [
          Container(
            height: 8.h,
            width: 18.w,
            child: Center(
                child: FaIcon(
              icon,
              color: Colors.white,
            )),
            decoration: BoxDecoration(
                color: Colors.purple.shade400,
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 1.2.h,
          ),
          Text('Content here')
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
