import 'links.dart';

class Pagination {
  Pagination({
    required this.total,
    required this.pages,
    required this.page,
    required this.limit,
    required this.links,
  });

  late final int total;
  late final int pages;
  late final int page;
  late final int limit;
  late final Links links;

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pages = json['pages'];
    page = json['page'];
    limit = json['limit'];
    links = Links.fromJson(json['links']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['pages'] = pages;
    _data['page'] = page;
    _data['limit'] = limit;
    _data['links'] = links.toJson();
    return _data;
  }
}