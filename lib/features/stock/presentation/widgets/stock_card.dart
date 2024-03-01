import 'package:cmsna/features/stock/presentation/pages/stock_main.dart';
import 'package:cmsna/features/stock/presentation/widgets/card_detail.dart';
import 'package:flutter/material.dart';

// final List<Stock> stocks = [
//   Stock(
//     logoUrl:
//         'https://static.vecteezy.com/system/resources/thumbnails/005/533/524/small/stock-illustration-awesome-abstract-consulting-design-logo-icon-isolated-free-vector.jpg',
//     date: DateTime.now(),
//     description:
//         'Stock 1 is a growth stock that has been outperforming the market recently. It belongs to a well-established company with a large market capitalization[^1^][5].',
//     imageUrl:
//         'https://static.vecteezy.com/system/resources/thumbnails/005/533/524/small/stock-illustration-awesome-abstract-consulting-design-logo-icon-isolated-free-vector.jpg',
//   ),
//   Stock(
//     logoUrl:
//         'https://static.vecteezy.com/system/resources/thumbnails/005/533/524/small/stock-illustration-awesome-abstract-consulting-design-logo-icon-isolated-free-vector.jpg',
//     date: DateTime.now(),
//     description:
//         'Stock 2 is a value stock that is currently trading at a discount. It belongs to a company that is expected to grow at a faster rate compared to the broader market[^2^][6].',
//     imageUrl:
//         'https://static.vecteezy.com/system/resources/thumbnails/005/533/524/small/stock-illustration-awesome-abstract-consulting-design-logo-icon-isolated-free-vector.jpg',
//   ),
//   Stock(
//     logoUrl: 'https://example.com/logo3.png',
//     date: DateTime.now(),
//     description:
//         'Stock 3 is a common stock that represents partial ownership in a corporation. It entitles investors to generated profits, usually paid in dividends[^3^][7].',
//     imageUrl: 'https://example.com/image3.png',
//   ),
//   Stock(
//     logoUrl: 'https://example.com/logo4.png',
//     date: DateTime.now(),
//     description:
//         'Stock 4 is a preferred stock that entitles the holder to regular dividend payments before dividends are issued to common shareholders[^4^][8].',
//     imageUrl: 'https://example.com/image4.png',
//   ),
//   // Add more stocks as needed...
// ];
class StockCard extends StatelessWidget {
  final Stock stock;

  StockCard({required this.stock});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CardDetail(stock: stock)),
        );
      },
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Container(
          height: 200, // Set the height of the card
          width: double.infinity, // Set the width of the card
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(stock.logoUrl, width: 30, height: 30),
                    SizedBox(width: 8),
                    Text(
                      '${stock.date.month}/${stock.date.day}/${stock.date.year}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        stock.description,
                        maxLines: 3, // Limit the description to 2 lines
                        overflow: TextOverflow
                            .ellipsis, // Add ellipsis when the description is too long
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 8),
                    Image.network(stock.imageUrl, width: 100, height: 100),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
