
import 'dart:convert';

class ComicModel {
  ComicModel({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    this.variantDescription,
    this.description,
    required this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceUri,
    required this.urls,
    required this.series,
    required this.variants,
    required this.collections,
    required this.collectedIssues,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  int id;
  int digitalId;
  Title? title;
  int issueNumber;
  String? variantDescription;
  String? description;
  String modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int pageCount;
  List<dynamic> textObjects;
  String resourceUri;
  List<Url> urls;
  Series series;
  List<Series> variants;
  List<dynamic> collections;
  List<dynamic> collectedIssues;
  List<Date> dates;
  List<Price> prices;
  Thumbnail thumbnail;
  List<dynamic> images;
  Characters creators;
  Characters characters;
  Characters stories;
  Characters events;

  factory ComicModel.fromJson(String str) => ComicModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicModel.fromMap(Map<String, dynamic> json) => ComicModel(
    id: json["id"],
    digitalId: json["digitalId"],
    title: titleValues.map[json["title"]],
    issueNumber: json["issueNumber"],
    variantDescription: json["variantDescription"],
    description: json["description"],
    modified: json["modified"],
    isbn: json["isbn"],
    upc: json["upc"],
    diamondCode: json["diamondCode"],
    ean: json["ean"],
    issn: json["issn"],
    format: json["format"],
    pageCount: json["pageCount"],
    textObjects: List<dynamic>.from(json["textObjects"].map((x) => x)),
    resourceUri: json["resourceURI"],
    urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
    series: Series.fromMap(json["series"]),
    variants: List<Series>.from(json["variants"].map((x) => Series.fromMap(x))),
    collections: List<dynamic>.from(json["collections"].map((x) => x)),
    collectedIssues: List<dynamic>.from(json["collectedIssues"].map((x) => x)),
    dates: List<Date>.from(json["dates"].map((x) => Date.fromMap(x))),
    prices: List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
    thumbnail: Thumbnail.fromMap(json["thumbnail"]),
    images: List<dynamic>.from(json["images"].map((x) => x)),
    creators: Characters.fromMap(json["creators"]),
    characters: Characters.fromMap(json["characters"]),
    stories: Characters.fromMap(json["stories"]),
    events: Characters.fromMap(json["events"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "digitalId": digitalId,
    "title": titleValues.reverse[title],
    "issueNumber": issueNumber,
    "variantDescription": variantDescription,
    "description": description,
    "modified": modified,
    "isbn": isbn,
    "upc": upc,
    "diamondCode": diamondCode,
    "ean": ean,
    "issn": issn,
    "format": format,
    "pageCount": pageCount,
    "textObjects": List<dynamic>.from(textObjects.map((x) => x)),
    "resourceURI": resourceUri,
    "urls": List<dynamic>.from(urls.map((x) => x.toMap())),
    "series": series.toMap(),
    "variants": List<dynamic>.from(variants.map((x) => x.toMap())),
    "collections": List<dynamic>.from(collections.map((x) => x)),
    "collectedIssues": List<dynamic>.from(collectedIssues.map((x) => x)),
    "dates": List<dynamic>.from(dates.map((x) => x.toMap())),
    "prices": List<dynamic>.from(prices.map((x) => x.toMap())),
    "thumbnail": thumbnail.toMap(),
    "images": List<dynamic>.from(images.map((x) => x)),
    "creators": creators.toMap(),
    "characters": characters.toMap(),
    "stories": stories.toMap(),
    "events": events.toMap(),
  };
}

class Characters {
  Characters({
    this.available,
    this.collectionUri,
    required this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<Item> items;
  int? returned;

  factory Characters.fromJson(String str) => Characters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Characters.fromMap(Map<String, dynamic> json) => Characters(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toMap() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toMap())),
    "returned": returned,
  };
}

class Item {
  Item({
    this.resourceUri,
    this.name,
    this.role,
    this.type,
  });

  String? resourceUri;
  String? name;
  String? role;
  String? type;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    resourceUri: json["resourceURI"],
    name: json["name"],
    role: json["role"] == null ? null : json["role"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toMap() => {
    "resourceURI": resourceUri,
    "name": name,
    "role": role == null ? null : role,
    "type": type == null ? null : type,
  };
}

class Date {
  Date({
    this.type,
    this.date,
  });

  String? type;
  String? date;

  factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Date.fromMap(Map<String, dynamic> json) => Date(
    type: json["type"],
    date: json["date"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "date": date,
  };
}

class Price {
  Price({
    this.type,
    this.price,
  });

  String? type;
  int? price;

  factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Price.fromMap(Map<String, dynamic> json) => Price(
    type: json["type"],
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "price": price,
  };
}

class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  Title? name;

  factory Series.fromJson(String str) => Series.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Series.fromMap(Map<String, dynamic> json) => Series(
    resourceUri: json["resourceURI"],
    name: titleValues.map[json["name"]],
  );

  Map<String, dynamic> toMap() => {
    "resourceURI": resourceUri,
    "name": titleValues.reverse[name],
  };
}

enum Title { MARVEL_PREVIEWS_2017_PRESENT, MARVEL_PREVIEWS_2017 }

final titleValues = EnumValues({
  "Marvel Previews (2017)": Title.MARVEL_PREVIEWS_2017,
  "Marvel Previews (2017 - Present)": Title.MARVEL_PREVIEWS_2017_PRESENT
});

class Thumbnail {
  Thumbnail({
    this.path,
    this.extension,
  });

  String? path;
  String? extension;

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
    path: json["path"],
    extension: json["extension"],
  );

  Map<String, dynamic> toMap() => {
    "path": path,
    "extension": extension,
  };
}

class Url {
  Url({
    this.type,
    this.url,
  });

  String? type;
  String? url;

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Url.fromMap(Map<String, dynamic> json) => Url(
    type: json["type"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "url": url,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}