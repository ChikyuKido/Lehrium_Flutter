class Comment {
  final int commentId;
  final String commentContent;
  final int creationDate;

  Comment(this.commentId, this.commentContent, this.creationDate);

  factory Comment.fromJson(dynamic json) {
    return Comment(json['commentId'], json['commentContent'], json['creationDate']);
  }
  static List<Comment> commentsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Comment.fromJson(data);
    }).toList();
  }
}