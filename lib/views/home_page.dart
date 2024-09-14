import 'package:flutter/material.dart';
import 'package:lehrium_flutter/modules/teacher.api.dart';
import 'package:lehrium_flutter/views/teacher_page.dart';
import 'package:lehrium_flutter/views/widgets/teacher_card.dart';

import 'package:lehrium_flutter/modules/teacher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Teacher> _teachers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getTeachers();
  }

  Future<void> getTeachers() async {
    _teachers = await TeacherApi.getTeachers();
    setState(() {
      _isLoading = false;
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
      body: _isLoading ? const Center(child: CircularProgressIndicator()) :
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: _teachers.length,
        itemBuilder: (context, index) {
          final teacher = _teachers[index];
          return GestureDetector(
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => TeacherPage(teacherId: teacher.id))),
            child: TeacherCard(
              teacher: teacher,
            ),
          );
        },
      ),
    );
  }
}
