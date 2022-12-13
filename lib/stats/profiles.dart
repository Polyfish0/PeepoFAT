class Profiles {
  final int id;
  final int age;
  final int size;
  final bool male;

  const Profiles({
    required this.id,
    required this.age,
    required this.size,
    required this.male
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "age": age,
      "size": size,
      "male": male
    };
  }
}