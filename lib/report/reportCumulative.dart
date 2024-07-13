import 'package:flutter/material.dart';

class CumulativeReport extends StatefulWidget {
  const CumulativeReport({super.key});

  @override
  State<CumulativeReport> createState() => _CumulativeReportState();
}

class _CumulativeReportState extends State<CumulativeReport> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '누적 분석 리포트 내용',
            style: TextStyle(fontSize: 18),
          ),
        ),
        // More content here...
      ],
    );
  }
}
