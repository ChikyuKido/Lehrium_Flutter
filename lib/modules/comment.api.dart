import 'dart:convert';

import 'package:lehrium_flutter/modules/comment.dart';
import 'package:http/http.dart' as http;

class CommentApi {
  static Future<List<Comment>> getComments() async {
    var uri = Uri.http("192.168.178.23:8780","/comments");

    final response = await http.get(uri);

    List data = jsonDecode(response.body);
    return Comment.commentsFromSnapshot(data);
  }
}