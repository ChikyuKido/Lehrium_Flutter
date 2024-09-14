import 'dart:convert';

import 'package:lehrium_flutter/modules/teacher.dart';
import 'package:http/http.dart' as http;

class TeacherApi {
 
  static Future<List<Teacher>> getTeachers() async {
    var uri = Uri.http("192.168.178.23:8780","/teachers");

    final response = await http.get(uri);

    List data = jsonDecode(response.body);
    return Teacher.teachersFromSnapshot(data);
  }
  
}