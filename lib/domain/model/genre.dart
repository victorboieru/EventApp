class Genre {
  String id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Genre &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              id == other.id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}