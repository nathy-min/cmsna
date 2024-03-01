import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:cmsna/features/home/presentation/widgets/auther_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.user,
    required this.time,
    required this.minutesToRead,
  });

  final String image;
  final String title;
  final String description;
  final LastModifiedBy user;
  final DateTime time;
  final String minutesToRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1.2.h),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.5),
            //   spreadRadius: 1,
            //   blurRadius: 4,
            //   offset: Offset(-1, 1),
            // ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 50.w),
                    child: Text(title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.bold, fontSize: 18.px)),
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 60.w),
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              Container(
                height: 10.h,
                width: 20.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(image))),
              ),
            ],
          ),
          AutherListTile(
            minutesToRead: minutesToRead,
            time: time,
            user: user,
          )
        ],
      ),
    );
  }
}
