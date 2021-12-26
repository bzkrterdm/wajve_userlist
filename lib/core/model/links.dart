class Links {
  Links({
    required this.previous,
    required this.current,
    required this.next,
  });

  late final String? previous;
  late final String current;
  late final String next;

  Links.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    current = json['current'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['previous'] = previous;
    _data['current'] = current;
    _data['next'] = next;
    return _data;
  }
}