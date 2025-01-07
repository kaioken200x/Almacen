import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: _createSampleData(),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: true),
                    bottomTitles: SideTitles(showTitles: true),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Zona')),
                  DataColumn(label: Text('Mes Actual')),
                  DataColumn(label: Text('Mes Anterior')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Zona 1')),
                    DataCell(Text('100')),
                    DataCell(Text('90')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Zona 2')),
                    DataCell(Text('150')),
                    DataCell(Text('140')),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _createSampleData() {
    final data = [
      InventoryData('Zona 1', 100, 90),
      InventoryData('Zona 2', 150, 140),
    ];

    return data.map((item) {
      return BarChartGroupData(
        x: data.indexOf(item),
        barRods: [
          BarChartRodData(
              y: item.currentMonth.toDouble(), colors: [Colors.blue]),
          BarChartRodData(
              y: item.previousMonth.toDouble(), colors: [Colors.red]),
        ],
      );
    }).toList();
  }
}

class InventoryData {
  final String zone;
  final int currentMonth;
  final int previousMonth;

  InventoryData(this.zone, this.currentMonth, this.previousMonth);
}
