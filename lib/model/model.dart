import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Flags flags;
  Name name;
  List<String> tld;
  Map<String, Currency> currencies;
  List<String> capital;
  Region region;
  String subregion;
  Map<String, String> languages;
  List<String> borders;
  int population;

  Welcome({
    required this.flags,
    required this.name,
    required this.tld,
    required this.currencies,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.borders,
    required this.population,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    flags: Flags.fromJson(json["flags"]),
    name: Name.fromJson(json["name"]),
    tld: List<String>.from(json["tld"].map((x) => x)),
    currencies: Map.from(
      json["currencies"],
    ).map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
    capital: List<String>.from(json["capital"].map((x) => x)),
    region: regionValues.map[json["region"]]!,
    subregion: json["subregion"],
    languages: Map.from(
      json["languages"],
    ).map((k, v) => MapEntry<String, String>(k, v)),
    borders: List<String>.from(json["borders"].map((x) => x)),
    population: json["population"],
  );

  Map<String, dynamic> toJson() => {
    "flags": flags.toJson(),
    "name": name.toJson(),
    "tld": List<dynamic>.from(tld.map((x) => x)),
    "currencies": Map.from(
      currencies,
    ).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "capital": List<dynamic>.from(capital.map((x) => x)),
    "region": regionValues.reverse[region],
    "subregion": subregion,
    "languages": Map.from(
      languages,
    ).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "borders": List<dynamic>.from(borders.map((x) => x)),
    "population": population,
  };
}

class Currency {
  String name;
  String symbol;

  Currency({required this.name, required this.symbol});

  factory Currency.fromJson(Map<String, dynamic> json) =>
      Currency(name: json["name"], symbol: json["symbol"]);

  Map<String, dynamic> toJson() => {"name": name, "symbol": symbol};
}

class Flags {
  String png;
  String svg;
  String alt;

  Flags({required this.png, required this.svg, required this.alt});

  factory Flags.fromJson(Map<String, dynamic> json) =>
      Flags(png: json["png"], svg: json["svg"], alt: json["alt"]);

  Map<String, dynamic> toJson() => {"png": png, "svg": svg, "alt": alt};
}

class Name {
  String common;
  String official;
  Map<String, NativeName> nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json["common"],
    official: json["official"],
    nativeName: Map.from(
      json["nativeName"],
    ).map((k, v) => MapEntry<String, NativeName>(k, NativeName.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
    "nativeName": Map.from(
      nativeName,
    ).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class NativeName {
  String official;
  String common;

  NativeName({required this.official, required this.common});

  factory NativeName.fromJson(Map<String, dynamic> json) =>
      NativeName(official: json["official"], common: json["common"]);

  Map<String, dynamic> toJson() => {"official": official, "common": common};
}

enum Region { AFRICA, AMERICAS, ANTARCTIC, ASIA, EUROPE, OCEANIA }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
