// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'components/books_result.dart';

class BooksModel {
  int? count;
  String? next;
  String? previous;
  List<BooksResult>? results;

  BooksModel({this.count, this.next, this.previous, this.results});

  BooksModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<BooksResult>? results,
  }) {
    return BooksModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'previous': previous,
      'results': results?.map((x) => x.toMap()).toList(),
    };
  }

  factory BooksModel.fromMap(Map<String, dynamic> map) {
    return BooksModel(
      count: map['count'] != null ? map['count'] as int : null,
      next: map['next'] != null ? map['next'] as String : null,
      previous: map['previous'] != null ? map['previous'] as String : null,
      results: map['results'] != null
          ? List<BooksResult>.from(
              (map['results'] as List<dynamic>).map<BooksResult?>(
                (x) => BooksResult.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BooksModel.fromJson(String source) =>
      BooksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BooksModel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(covariant BooksModel other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}
