import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lehrium_flutter/modules/teacher_full.dart';

class TeacherFullApi {
  static Future<TeacherFull> getTeacher() async {
    var uri = Uri.http("192.168.178.23:8780","/teacherid");
    final response = await http.get(uri);
    dynamic data = jsonDecode(response.body);
    return TeacherFull.fromJson(data);
  }

}