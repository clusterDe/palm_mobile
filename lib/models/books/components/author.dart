import 'dart:convert';

class Author {
  String? name;
  int? birthYear;
  int? deathYear;

  Author({this.name, this.birthYear, this.deathYear});

  Author copyWith({String? name, int? birthYear, int? deathYear}) {
    return Author(
      name: name ?? this.name,
      birthYear: birthYear ?? this.birthYear,
      deathYear: deathYear ?? this.deathYear,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'birth_year': birthYear,
      'death_year': deathYear,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      name: map['name'] != null ? map['name'] as String : null,
      birthYear: map['birth_year'] != null ? map['birth_year'] as int : null,
      deathYear: map['death_year'] != null ? map['death_year'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) =>
      Author.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Author(name: $name, birth_year: $birthYear, death_year: $deathYear)';

  @override
  bool operator ==(covariant Author other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.birthYear == birthYear &&
        other.deathYear == deathYear;
  }

  @override
  int get hashCode => name.hashCode ^ birthYear.hashCode ^ deathYear.hashCode;
}
