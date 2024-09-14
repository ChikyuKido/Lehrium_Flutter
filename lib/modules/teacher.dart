class Teacher {
  final int id;
  final String name;
  final String imageUrl;
  final double rating;

  Teacher(this.id, this.name, this.imageUrl, this.rating);

  factory Teacher.fromJson(dynamic json) {
    return Teacher(json['id'], json['name'], json['imageUrl'], json['rating']);
  }
  static List<Teacher> teachersFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Teacher.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Teacher{id: $id, name: $name, imageUrl: $imageUrl, rating: $rating}';
  }
}