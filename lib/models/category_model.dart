class CategoryModel {
  String? id;
  String name;

  CategoryModel({this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> map) =>
      CategoryModel(
        id: map['id'],
        name: map['name'],
      );

  
  @override
  String toString() {
    return 'CategoryModel{id: $id, name: $name}';
  }
}