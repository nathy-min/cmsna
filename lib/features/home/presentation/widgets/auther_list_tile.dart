import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AutherListTile extends StatelessWidget {
  final LastModifiedBy user;
  final DateTime time;
  final String minutesToRead;
  const AutherListTile({
    super.key,
    required this.user,
    required this.time,
    required this.minutesToRead,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 5.h,
        width: 12.w,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(user.profilePhoto)),
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            shape: BoxShape.circle),
      ),
      title: Text(
        user.firstName + ' ' + user.lastName,
        style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(DateFormat('MMMM dd, yyyy').format(time) +
          '. $minutesToRead min read'),
    );
  }
}
