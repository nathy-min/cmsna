import 'package:cmsna/features/stock/presentation/pages/stock_main.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class ChartSampleData {
  ChartSampleData({
    required this.x,
    required this.y,
  });

  final DateTime x;
  final double y;
}

class CardDetail extends StatelessWidget {
  final Stock stock;

  CardDetail({required this.stock});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    double lastY = 50; // Initial y value
    List<ChartSampleData> chartData = [];
    for (int i = 1; i <= 30; i++) {
      lastY += (random.nextDouble() - 0.5) * 10;
      chartData.add(ChartSampleData(x: DateTime(2020, i, 1), y: lastY));
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Stock Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(stock.imageUrl),
              ),
              SizedBox(height: 8),
              Text(
                'Stock Value Graph',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '123', // Replace with your stock value
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                'USD',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Container(
                height: 200,
                child: SfCartesianChart(
                  primaryXAxis: DateTimeAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                  ),
                  primaryYAxis: NumericAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                  ),
                  series: <StackedAreaSeries<ChartSampleData, DateTime>>[
                    StackedAreaSeries<ChartSampleData, DateTime>(
                      dataSource: chartData,
                      xValueMapper: (ChartSampleData sales, _) => sales.x,
                      yValueMapper: (ChartSampleData sales, _) => sales.y,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 243, 100, 33),
                          const Color.fromARGB(255, 33, 243, 33)
                              .withOpacity(0.1)
                        ],
                        stops: [0.2, 0.8],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    // Add more series...
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1D'),
                  Text('5D'),
                  Text('1M'),
                  Text('YTD'),
                  Text('1Y'),
                  Text('5Y'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text('All'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MKT CAP 1.638T'),
                  Text('P/E 25.28'),
                  Text('EPS 5.25'),
                  Text('More'),
                ],
              ),
              SizedBox(height: 8),
              TabBar(
                tabs: [
                  Tab(text: 'News'),
                  Tab(text: 'Minds'),
                  Tab(text: 'Ideas'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('News Content')),
                    Center(child: Text('Minds Content')),
                    Center(child: Text('Ideas Content')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
