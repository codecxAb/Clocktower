class Account {
  final String id;
  String name;
  List<int> builderIds;

  Account({
    required this.id,
    required this.name,
    List<int>? builderIds,
  }) : builderIds = builderIds ?? [1, 2];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'builderIds': builderIds,
    };
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
      builderIds: List<int>.from(json['builderIds'] ?? [1, 2]),
    );
  }
}
