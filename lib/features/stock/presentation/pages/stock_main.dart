import 'package:cmsna/features/stock/presentation/widgets/stock_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Stock {
  final String logoUrl;
  final DateTime date;
  final String description;
  final String imageUrl;

  Stock({
    required this.logoUrl,
    required this.date,
    required this.description,
    required this.imageUrl,
  });
}

class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  String selectedTag = 'Overview'; // Variable to store the selected tag

  final List<Stock> stocks = [
    Stock(
      logoUrl:
          'https://img.freepik.com/premium-vector/trading-logo_377005-130.jpg',
      date: DateTime.now(),
      description:
          'Stock 1 is a growth stock that has been outperforming the market recently. It belongs to a well-established company with a large market capitalization[^1^][5].',
      imageUrl:
          'https://img.freepik.com/premium-vector/free-vector-growth-arrow-logo-template-design_634294-291.jpg',
    ),
    Stock(
      logoUrl:
          'https://img.freepik.com/premium-vector/trading-logo_377005-130.jpg',
      date: DateTime.now(),
      description:
          'Stock 2 is a value stock that has been undervalued by the market. It belongs to a company with strong fundamentals and a low price-to-earnings ratio.',
      imageUrl:
          'https://www.shutterstock.com/image-illustration/stock-market-forex-trading-graph-260nw-1170542251.jpg',
    ),
    Stock(
      logoUrl:
          'https://img.freepik.com/premium-vector/trading-logo_377005-130.jpg',
      date: DateTime.now(),
      description:
          'Stock 3 is a dividend stock that regularly pays dividends. It belongs to a company with a long history of stable earnings.',
      imageUrl:
          'https://expressworld24.com/wp-content/uploads/2024/01/ai-generated-8490532_640.jpg',
    ),
    Stock(
      logoUrl:
          'https://img.freepik.com/premium-vector/trading-logo_377005-130.jpg',
      date: DateTime.now(),
      description:
          'Stock 4 is a cyclical stock that has been affected by macroeconomic changes. It belongs to a company in an industry that is highly sensitive to economic cycles.',
      imageUrl:
          'https://img.etimg.com/thumb/width-640,height-480,imgsize-132855,resizemode-75,msid-75172198/markets/stocks/news/what-changed-for-d-street-while-you-were-sleeping/stock-market-2-getty.jpg',
    ),

    // Add more stocks as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(),
        actions: [
          IconButton(
            icon: Icon(
                Icons.search), // Added a search icon on the right of the AppBar
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore Markets',
                style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold, fontSize: 24.px),
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['Overview', 'Stocks', 'Crypto', 'Forex']
                    .map((tag) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTag =
                                  tag; // Update the selected tag when clicked
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: selectedTag == tag
                                  ? Colors.grey[200]
                                  : Colors
                                      .transparent, // Light grey background if selected
                              borderRadius: BorderRadius.circular(
                                  12.0), // Rounded borders
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: selectedTag == tag
                                    ? Colors.black
                                    : Colors
                                        .grey, // Black color if selected, grey otherwise
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height: 1.h),
              Container(
                height: 22.h,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.5.w, vertical: 1.2.h),
                        height: 20.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(1.2.h),
                            color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 1.2.h,
                            ),
                            Container(
                              height: 6.h,
                              width: 12.w,
                              decoration: BoxDecoration(
                                  color: (index % 2) == 0
                                      ? Colors.red
                                      : Colors.blue,
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                (index % 2) == 0 ? '500' : '100',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Text(
                              'S&P 500 -',
                              style: TextStyle(
                                  fontSize: 18.px, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'SFX',
                              style: TextStyle(),
                            ),
                            Text(
                              '4347.36',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20.px),
                            ),
                            Text(
                              '-0.81%',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: 1.h),
              Text(
                'Top Stories',
                style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.px), // A little smaller than 'Explore Markets'
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: stocks.length,
                itemBuilder: (context, index) {
                  return StockCard(stock: stocks[index]);
                },
              ),
              // Add more widgets for the top stories here...
            ],
          ),
        ),
      ),
    );
  }
}
