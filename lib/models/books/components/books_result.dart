// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'author.dart';
import 'formats.dart';

class BooksResult {
  int? id;
  String? title;
  List<Author>? authors;
  List<String>? summaries;
  List<Author>? translators;
  List<String>? subjects;
  List<String>? bookshelves;
  List<String>? languages;
  bool? copyright;
  String? mediaType;
  Formats? formats;
  int downloadCount;

  BooksResult({
    this.id,
    this.title,
    this.authors,
    this.summaries,
    this.translators,
    this.subjects,
    this.bookshelves,
    this.languages,
    this.copyright,
    this.mediaType,
    this.formats,
    required this.downloadCount,
  });

  BooksResult copyWith({
    int? id,
    String? title,
    List<Author>? authors,
    List<String>? summaries,
    List<Author>? translators,
    List<String>? subjects,
    List<String>? bookshelves,
    List<String>? languages,
    bool? copyright,
    String? mediaType,
    Formats? formats,
    int? downloadCount,
  }) {
    return BooksResult(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      summaries: summaries ?? this.summaries,
      translators: translators ?? this.translators,
      subjects: subjects ?? this.subjects,
      bookshelves: bookshelves ?? this.bookshelves,
      languages: languages ?? this.languages,
      copyright: copyright ?? this.copyright,
      mediaType: mediaType ?? this.mediaType,
      formats: formats ?? this.formats,
      downloadCount: downloadCount ?? this.downloadCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'authors': authors?.map((x) => x.toMap()).toList(),
      'summaries': summaries,
      'translators': translators?.map((x) => x.toMap()).toList(),
      'subjects': subjects,
      'bookshelves': bookshelves,
      'languages': languages,
      'copyright': copyright,
      'media_type': mediaType,
      'formats': formats?.toMap(),
      'download_count': downloadCount,
    };
  }

  factory BooksResult.fromMap(Map<String, dynamic> map) {
    return BooksResult(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      authors: map['authors'] != null
          ? List<Author>.from(
              (map['authors'] as List<int>).map<Author?>(
                (x) => Author.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      summaries: map['summaries'] != null
          ? List<String>.from((map['summaries'] as List<String>))
          : null,
      translators: map['translators'] != null
          ? List<Author>.from(
              (map['translators'] as List<int>).map<Author?>(
                (x) => Author.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      subjects: map['subjects'] != null
          ? List<String>.from((map['subjects'] as List<String>))
          : null,
      bookshelves: map['bookshelves'] != null
          ? List<String>.from((map['bookshelves'] as List<String>))
          : null,
      languages: map['languages'] != null
          ? List<String>.from((map['languages'] as List<String>))
          : null,
      copyright: map['copyright'] != null ? map['copyright'] as bool : null,
      mediaType: map['media_type'] != null ? map['media_type'] as String : null,
      formats: map['formats'] != null
          ? Formats.fromMap(map['formats'] as Map<String, dynamic>)
          : null,
      downloadCount: map['download_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BooksResult.fromJson(String source) =>
      BooksResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BooksResult(id: $id, title: $title, authors: $authors, summaries: $summaries, translators: $translators, subjects: $subjects, bookshelves: $bookshelves, languages: $languages, copyright: $copyright, media_type: $mediaType, formats: $formats, download_count: $downloadCount)';
  }

  @override
  bool operator ==(covariant BooksResult other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        listEquals(other.authors, authors) &&
        listEquals(other.summaries, summaries) &&
        listEquals(other.translators, translators) &&
        listEquals(other.subjects, subjects) &&
        listEquals(other.bookshelves, bookshelves) &&
        listEquals(other.languages, languages) &&
        other.copyright == copyright &&
        other.mediaType == mediaType &&
        other.formats == formats &&
        other.downloadCount == downloadCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        authors.hashCode ^
        summaries.hashCode ^
        translators.hashCode ^
        subjects.hashCode ^
        bookshelves.hashCode ^
        languages.hashCode ^
        copyright.hashCode ^
        mediaType.hashCode ^
        formats.hashCode ^
        downloadCount.hashCode;
  }
}
