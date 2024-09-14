import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lehrium_flutter/modules/comment.dart';

class TeacherComment extends StatefulWidget {
  final Comment comment;
  const TeacherComment({super.key, required this.comment});


  @override
  State<TeacherComment> createState() => _TeacherCommentState();
}

class _TeacherCommentState extends State<TeacherComment> {
  bool _enlarged = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          _enlarged = !_enlarged;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: theme.highlightColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.6),
              offset: const Offset(0.0, 6.0),
              blurRadius: 10.0,
              spreadRadius: -2.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8.0,right: 8.0),
                child: Text(
                  widget.comment.commentContent,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    overflow: _enlarged ? null : TextOverflow.ellipsis,
                  ),
                  maxLines: _enlarged ? null : 2,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10,bottom: 5),
                  child: Text(
                      DateFormat('yyyy-MM-dd HH:mm').format(DateTime.fromMillisecondsSinceEpoch(widget.comment.creationDate*1000,isUtc: true))
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
