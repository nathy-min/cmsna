import 'package:flutter/material.dart';
import 'package:cmsna/features/home/presentation/pages/homepage.dart';
import 'package:cmsna/features/search/presentation/pages/search_main.dart';
import 'package:cmsna/features/contact/presentation/contact_page.dart';

class CustomNavigationBar extends StatefulWidget {
  final int initialIndex;

  CustomNavigationBar({this.initialIndex = 0});

  @override
  _CustomNavigationBarState createState() =>
      _CustomNavigationBarState(initialIndex: initialIndex);
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late int _currentIndex;

  _CustomNavigationBarState({required int initialIndex}) {
    _currentIndex = initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  getIconData(index),
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  if (index >= 0 && index < 5) {
                    setState(() {
                      _currentIndex = index;
                    });
                    navigateToPage(context, index);
                  }
                },
              ),
              _currentIndex == index
                  ? Text(
                      getLabel(index),
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                  : Container(),
            ],
          );
        }),
      ),
    );
  }

  IconData getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.search;
      case 2:
        return Icons.menu_open_sharp;
      case 3:
        return Icons.person;
      case 4:
        return Icons.settings;
      default:
        return Icons.home_outlined;
    }
  }

  String getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Product';
      case 3:
        return 'Account';
      case 4:
        return 'Services';
      default:
        return '';
    }
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ContactMePage()),
        );
        break;
      // Add other cases here
    }
  }
}
