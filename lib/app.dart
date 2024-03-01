import 'package:cmsna/features/auth/presentation/signinpage.dart';
import 'package:cmsna/features/blog/presentation/pages/blog_main.dart';
import 'package:cmsna/features/contact/presentation/contact_page.dart';
import 'package:cmsna/features/home/presentation/pages/homepage.dart';
import 'package:cmsna/features/search/presentation/pages/search_main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Your components/widgets for each tab/page
    Homepage(),
    // BlogPage(),

    SearchPage(),
    Container(
      color: Colors.yellow,
    ),
    ContactMePage(),
    Container(
      color: Colors.red,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (position) {
          setState(() {
            _currentIndex = position;
          });
        },
        items: [
          SalomonBottomBarItem(
              unselectedColor: Colors.grey,
              selectedColor: Colors.purple,
              title: const Text('Home'),
              icon: const Icon(Icons.home)),
          SalomonBottomBarItem(
              unselectedColor: Colors.grey,
              selectedColor: Colors.purple,
              title: const Text('Search'),
              icon: const Icon(Icons.search)),
          SalomonBottomBarItem(
              unselectedColor: Colors.grey,
              selectedColor: Colors.purple,
              title: const Text('Product'),
              icon: const Icon(Icons.menu_open_sharp)),
          SalomonBottomBarItem(
              unselectedColor: Colors.grey,
              selectedColor: Colors.purple,
              title: const Text('Account'),
              icon: const Icon(Icons.person)),
          SalomonBottomBarItem(
              unselectedColor: Colors.grey,
              selectedColor: Colors.purple,
              title: const Text('Services'),
              icon: const Icon(Icons.settings)),
        ],
      ),
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     actions: [
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => SignInPage()));
      //         },
      //         child: Text(
      //           "Sign in",
      //           style: GoogleFonts.plusJakartaSans(
      //               color: Colors.purple, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       SizedBox(
      //         width: 2.w,
      //       )
      //     ],
      //     shadowColor: Colors.grey,
      //     backgroundColor: Colors.white,
      //     elevation: 2,
      //     title: Container(
      //       height: 10.h,
      //       width: 30.w,
      //       decoration: BoxDecoration(
      //           image: DecorationImage(
      //               image: NetworkImage(
      //                   'https://findsmash.com/_ipx/f_webp/msn3-logo.png'))),
      //     )),
      body: _pages[_currentIndex],
    );
  }
}
