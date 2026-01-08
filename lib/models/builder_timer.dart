class BuilderTimer {
  final int id;
  String workName;
  DateTime? startTime;
  DateTime? endTime;
  bool isActive;

  BuilderTimer({
    required this.id,
    this.workName = '',
    this.startTime,
    this.endTime,
    this.isActive = false,
  });

  Duration? get remainingTime {
    if (!isActive || endTime == null) return null;
    final now = DateTime.now();
    if (now.isAfter(endTime!)) return Duration.zero;
    return endTime!.difference(now);
  }

  bool get isCompleted {
    if (!isActive || endTime == null) return false;
    return DateTime.now().isAfter(endTime!);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'workName': workName,
      'startTime': startTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'isActive': isActive,
    };
  }

  factory BuilderTimer.fromJson(Map<String, dynamic> json) {
    return BuilderTimer(
      id: json['id'],
      workName: json['workName'] ?? '',
      startTime: json['startTime'] != null
          ? DateTime.parse(json['startTime'])
          : null,
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
      isActive: json['isActive'] ?? false,
    );
  }
}
