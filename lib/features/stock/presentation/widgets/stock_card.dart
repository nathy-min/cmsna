import 'package:cmsna/features/stock/presentation/pages/stock_main.dart';
import 'package:cmsna/features/stock/presentation/widgets/card_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        elevation: 0.0, // Add some elevation to the card for a modern look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Add rounded corners
        ),
        child: Container(
          color: Colors.white,
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Increase the padding
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align content to the start
              children: [
                Row(
                  children: [
                    Image.network(stock.logoUrl, width: 30, height: 30),
                    SizedBox(width: 8),
                    Text(
                      '${DateFormat.jm().format(stock.date)}. ${DateFormat.MMMd().format(stock.date)}. TradeView',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(height: 16), // Increase the spacing
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        stock.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.radioCanada(
                            fontSize:
                                18.sp), // Make the description text darker
                      ),
                    ),
                    SizedBox(width: 16), // Increase the spacing
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10), // Add rounded corners to the image
                      child: Image.network(stock.imageUrl,
                          width: 100, height: 100),
                    ),
                  ],
                ),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(
                      top: 2.0,
                      bottom: 2.0), // Same as `blurRadius` in BoxShadow
                  child: Divider(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
