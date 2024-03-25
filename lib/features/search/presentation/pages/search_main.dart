import 'package:cmsna/features/home/presentation/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SearchPage());
}

class SearchPage extends StatelessWidget {
  final List<String> items = List.generate(100, (index) => "Item $index");
  List<String> filteredItems = [];

  @override
  Widget build(BuildContext context) {
    List<String> filteredItems = List.from(items);
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        initialIndex: 1,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                hintText: 'Search for anything...',
                filled: true,
                fillColor: Color(0xFF95c2da).withOpacity(0.8),
                border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black
                          .withOpacity(0.5), // Adjust opacity here (0.0 - 1.0)
                      BlendMode.dstATop,
                    ),
                    fit: BoxFit.cover,
                    image: AssetImage('images/search.jpg'))),
          ))
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: filteredItems.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return ListTile(
          //         title: Text(filteredItems[index]),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List.from(items);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      filteredItems = dummyListData;
    } else {
      filteredItems = List.from(items);
    }
  }
}
