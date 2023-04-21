class Dog{
  final String id;
  final String name;
  final String age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString(){
    return 'Dog{id: $id, name: $name, age:$age}';
  }
}