import 'dart:convert';

class Formats {
  String? textHtml;
  String? applicationEpubZip;
  String? applicationXMobipocketEbook;
  String? textPlainCharsetUsAscii;
  String? applicationRdfXml;
  String? imageJpeg;
  String? applicationOctetStream;
  String? textHtmlCharsetUtf8;
  String? textPlainCharsetUtf8;
  String? textPlainCharsetIso88591;
  String? textHtmlCharsetIso88591;
  String? textPlain;

  Formats({
    this.textHtml,
    this.applicationEpubZip,
    this.applicationXMobipocketEbook,
    this.textPlainCharsetUsAscii,
    this.applicationRdfXml,
    this.imageJpeg,
    this.applicationOctetStream,
    this.textHtmlCharsetUtf8,
    this.textPlainCharsetUtf8,
    this.textPlainCharsetIso88591,
    this.textHtmlCharsetIso88591,
    this.textPlain,
  });

  Formats copyWith({
    String? textHtml,
    String? applicationEpubZip,
    String? applicationXMobipocketEbook,
    String? textPlainCharsetUsAscii,
    String? applicationRdfXml,
    String? imageJpeg,
    String? applicationOctetStream,
    String? textHtmlCharsetUtf8,
    String? textPlainCharsetUtf8,
    String? textPlainCharsetIso88591,
    String? textHtmlCharsetIso88591,
    String? textPlain,
  }) {
    return Formats(
      textHtml: textHtml ?? this.textHtml,
      applicationEpubZip: applicationEpubZip ?? this.applicationEpubZip,
      applicationXMobipocketEbook:
          applicationXMobipocketEbook ?? this.applicationXMobipocketEbook,
      textPlainCharsetUsAscii:
          textPlainCharsetUsAscii ?? this.textPlainCharsetUsAscii,
      applicationRdfXml: applicationRdfXml ?? this.applicationRdfXml,
      imageJpeg: imageJpeg ?? this.imageJpeg,
      applicationOctetStream:
          applicationOctetStream ?? this.applicationOctetStream,
      textHtmlCharsetUtf8: textHtmlCharsetUtf8 ?? this.textHtmlCharsetUtf8,
      textPlainCharsetUtf8: textPlainCharsetUtf8 ?? this.textPlainCharsetUtf8,
      textPlainCharsetIso88591:
          textPlainCharsetIso88591 ?? this.textPlainCharsetIso88591,
      textHtmlCharsetIso88591:
          textHtmlCharsetIso88591 ?? this.textHtmlCharsetIso88591,
      textPlain: textPlain ?? this.textPlain,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text/html': textHtml,
      'application/epub+zip': applicationEpubZip,
      'application/x-mobipocket-ebook': applicationXMobipocketEbook,
      'text/plain; charset=us-ascii': textPlainCharsetUsAscii,
      'application/rdf+xml': applicationRdfXml,
      'image/jpeg': imageJpeg,
      'application/octet-stream': applicationOctetStream,
      'text/html; charset=utf-8': textHtmlCharsetUtf8,
      'text/plain; charset=utf-8': textPlainCharsetUtf8,
      'text/plain; charset=iso-8859-1': textPlainCharsetIso88591,
      'text/html; charset=iso-8859-1': textHtmlCharsetIso88591,
      'text/plain': textPlain,
    };
  }

  factory Formats.fromMap(Map<String, dynamic> map) {
    return Formats(
      textHtml: map['text/html'] != null ? map['text/html'] as String : null,
      applicationEpubZip: map['application/epub+zip'] != null
          ? map['application/epub+zip'] as String
          : null,
      applicationXMobipocketEbook: map['application/x-mobipocket-ebook'] != null
          ? map['application/x-mobipocket-ebook'] as String
          : null,
      textPlainCharsetUsAscii: map['text/plain; charset=us-ascii'] != null
          ? map['text/plain; charset=us-ascii'] as String
          : null,
      applicationRdfXml: map['application/rdf+xml'] != null
          ? map['application/rdf+xml'] as String
          : null,
      imageJpeg: map['image/jpeg'] != null ? map['image/jpeg'] as String : null,
      applicationOctetStream: map['application/octet-stream'] != null
          ? map['application/octet-stream'] as String
          : null,
      textHtmlCharsetUtf8: map['text/html; charset=utf-8'] != null
          ? map['text/html; charset=utf-8'] as String
          : null,
      textPlainCharsetUtf8: map['text/plain; charset=utf-8'] != null
          ? map['text/plain; charset=utf-8'] as String
          : null,
      textPlainCharsetIso88591: map['text/plain; charset=iso-8859-1'] != null
          ? map['text/plain; charset=iso-8859-1'] as String
          : null,
      textHtmlCharsetIso88591: map['text/html; charset=iso-8859-1'] != null
          ? map['text/html; charset=iso-8859-1'] as String
          : null,
      textPlain: map['text/plain'] != null ? map['text/plain'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Formats.fromJson(String source) =>
      Formats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Formats(text/html: $textHtml, application/epub+zip: $applicationEpubZip, application/x-mobipocket-ebook: $applicationXMobipocketEbook, text/plain; charset=us-ascii: $textPlainCharsetUsAscii, application/rdf+xml: $applicationRdfXml, image/jpeg: $imageJpeg, application/octet-stream: $applicationOctetStream, text/html; charset=utf-8: $textHtmlCharsetUtf8, text/plain; charset=utf-8: $textPlainCharsetUtf8, text/plain; charset=iso-8859-1: $textPlainCharsetIso88591, text/html; charset=iso-8859-1: $textHtmlCharsetIso88591, text/plain: $textPlain)';
  }

  @override
  bool operator ==(covariant Formats other) {
    if (identical(this, other)) return true;

    return other.textHtml == textHtml &&
        other.applicationEpubZip == applicationEpubZip &&
        other.applicationXMobipocketEbook == applicationXMobipocketEbook &&
        other.textPlainCharsetUsAscii == textPlainCharsetUsAscii &&
        other.applicationRdfXml == applicationRdfXml &&
        other.imageJpeg == imageJpeg &&
        other.applicationOctetStream == applicationOctetStream &&
        other.textHtmlCharsetUtf8 == textHtmlCharsetUtf8 &&
        other.textPlainCharsetUtf8 == textPlainCharsetUtf8 &&
        other.textPlainCharsetIso88591 == textPlainCharsetIso88591 &&
        other.textHtmlCharsetIso88591 == textHtmlCharsetIso88591 &&
        other.textPlain == textPlain;
  }

  @override
  int get hashCode {
    return textHtml.hashCode ^
        applicationEpubZip.hashCode ^
        applicationXMobipocketEbook.hashCode ^
        textPlainCharsetUsAscii.hashCode ^
        applicationRdfXml.hashCode ^
        imageJpeg.hashCode ^
        applicationOctetStream.hashCode ^
        textHtmlCharsetUtf8.hashCode ^
        textPlainCharsetUtf8.hashCode ^
        textPlainCharsetIso88591.hashCode ^
        textHtmlCharsetIso88591.hashCode ^
        textPlain.hashCode;
  }
}
