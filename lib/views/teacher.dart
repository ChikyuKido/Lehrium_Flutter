import 'package:flutter/material.dart';
import 'package:lehrium_flutter/modules/teacher.dart';
import 'package:lehrium_flutter/modules/teacher_full.api.dart';
import 'package:lehrium_flutter/modules/teacher_full.dart';
import 'package:lehrium_flutter/views/widgets/teacher_card.dart';
import 'package:lehrium_flutter/views/widgets/teacher_stats.dart';

class TeacherPage extends StatefulWidget {
  final int teacherId;
  const TeacherPage({super.key, required this.teacherId});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  late TeacherFull _teacher;
  bool _isLoadingTeacher = true;
  @override
  void initState() {
    super.initState();
    getTeacher();
  }
  Future<void> getTeacher() async {
    _teacher = await TeacherFullApi.getTeacher();
    setState(() {
      _isLoadingTeacher = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book),
            SizedBox(width: 10),
            Text("Lehrium")
          ],),
      ),
      body: Column(
        children: [
          _isLoadingTeacher ? const Center(child: CircularProgressIndicator())
          : Row(
            children: [
              TeacherCard(teacher: _teacher.toTeacher()),
              TeacherStats(teacher: _teacher,)
            ],
          )
        ],
      ),
    );
  }
}
