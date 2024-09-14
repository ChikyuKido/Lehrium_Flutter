import 'package:lehrium_flutter/modules/teacher.dart';

class TeacherFull {
  final int id;
  final String name;
  final String imageUrl;
  final double rating;
  final double teachingSkills;
  final double kindness;
  final double engagement;
  final double organization;


  TeacherFull(this.id, this.name, this.imageUrl, this.rating,
      this.teachingSkills, this.kindness, this.engagement, this.organization);

  factory TeacherFull.fromJson(dynamic json) {
    return TeacherFull(json['teacherId'], json['teacherName'],json['imageUrl'], json['rating'], json['teachingSkills'], json['kindness'], json['engagement'], json['organization']);
  }

  Teacher toTeacher() {
    return Teacher(id, name, imageUrl, rating);
  }
}