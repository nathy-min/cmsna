import 'package:cmsna/features/auth/presentation/signinpage.dart';
import 'package:cmsna/features/blog/presentation/pages/blog_main.dart';
import 'package:cmsna/features/contact/presentation/contact_page.dart';
import 'package:cmsna/features/home/presentation/bloc/menu_bloc.dart';
import 'package:cmsna/features/home/presentation/pages/homepage.dart';
import 'package:cmsna/features/search/presentation/pages/search_main.dart';
import 'package:cmsna/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Homepage(),
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
      body: _pages[_currentIndex],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:cmsna/router.dart' as router;

// import 'package:flutter/material.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
// import 'package:cmsna/router.dart' as router;

// class MainPage extends StatefulWidget {
//   MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _currentIndex;
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         key: _bottomNavigationKey,
//         index: _currentIndex,
//         items: [
//           CurvedNavigationBarItem(
//             child: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           CurvedNavigationBarItem(
//             child: Icon(Icons.search),
//             label: 'Search',
//           ),
//           CurvedNavigationBarItem(
//             child: Icon(Icons.menu_open_sharp),
//             label: 'Product',
//           ),
//           CurvedNavigationBarItem(
//             child: Icon(Icons.person),
//             label: 'Account',
//           ),
//           CurvedNavigationBarItem(
//             child: Icon(Icons.settings),
//             label: 'Services',
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//           switch (index) {
//             case 0:
//               router.router.go('/');
//               break;
//             case 1:
//               router.router.go('/search');
//               break;
//             case 2:
//               router.router.go('/product');
//               break;
//             case 3:
//               router.router.go('/account');
//               break;
//             case 4:
//               router.router.go('/services');
//               break;
//           }
//         },
//       ),
//       body: Builder(
//         builder: (BuildContext context) {
//           final location = GoRouter.of(context);
//           if (location. == '/') {
//             return Homepage();
//           } else if (location == '/search') {
//             return SearchPage();
//           } else if (location == '/contact') {
//             return ContactMePage();
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
