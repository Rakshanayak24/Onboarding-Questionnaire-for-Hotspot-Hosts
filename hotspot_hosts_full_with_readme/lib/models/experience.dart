class Experience {
  final int id;
  final String name;
  final String imageUrl;

  Experience({required this.id, required this.name, required this.imageUrl});

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    imageUrl: json['image_url'] ?? '',
  );
}
