class JobDto {
  final String title;
  final String type;
  final String level;
  final String? location;
  final bool isActive;

  JobDto({
    required this.title,
    required this.type,
    required this.level,
    this.location,
    required this.isActive,
  });

  factory JobDto.fromMap(Map<String, dynamic> map) {
    return JobDto(
      title: map['title'] as String,
      type: map['type'] as String,
      level: map['level'] as String,
      location: map['location'] != null ? map['location'] as String : null,
      isActive: map['is_active'] as bool,
    );
  }
}
