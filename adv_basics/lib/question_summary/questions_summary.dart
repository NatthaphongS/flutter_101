import 'package:adv_basics/question_summary/summary_item.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryDatas, {super.key});

  final List<Map<String, Object>> summaryDatas;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        // fix height and make it can scoll when overflow
        child: Column(
          children: summaryDatas.map((data) => SummaryItem(data)).toList(),
        ),
      ),
    );
  }
}
