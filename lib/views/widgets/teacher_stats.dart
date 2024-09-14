import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lehrium_flutter/modules/teacher_full.dart';


class TeacherStats extends StatelessWidget {
  final TeacherFull teacher;
  const TeacherStats({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const double maxBarWidth = 100;
    const double maxValue = 5;

    double calculateBarWidth(double value) {
      return (value / maxValue) * maxBarWidth;
    }

    return Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHorizontalBar(
                  context: context,
                  label: 'Rating',
                  value: teacher.rating,
                  barWidth: calculateBarWidth(teacher.rating),
                  color: theme.highlightColor,
                ),
                _buildHorizontalBar(
                  context: context,
                  label: 'Skills',
                  value: teacher.teachingSkills,
                  barWidth: calculateBarWidth(teacher.teachingSkills),
                  color: theme.highlightColor,
                ),
                _buildHorizontalBar(
                  context: context,
                  label: 'Kindness',
                  value: teacher.kindness,
                  barWidth: calculateBarWidth(teacher.kindness),
                  color: theme.highlightColor,
                ),
                _buildHorizontalBar(
                  context: context,
                  label: 'Engagement',
                  value: teacher.engagement,
                  barWidth: calculateBarWidth(teacher.engagement),
                  color: theme.highlightColor,
                ),
                _buildHorizontalBar(
                  context: context,
                  label: 'Organization',
                  value: teacher.organization,
                  barWidth: calculateBarWidth(teacher.organization),
                  color: theme.highlightColor,
                ),
              ],
          ),
        )
    );
  }

  Widget _buildHorizontalBar({
    required BuildContext context,
    required String label,
    required double value,
    required double barWidth,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100, // Fixed width for label column
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Container(
            height: 20,
            width: barWidth,
            color: color,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.centerRight,
            child: Text("$value"),
          ),
        ],
      ),
    );
  }
}