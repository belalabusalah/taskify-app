class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json["street"] ?? "",
      suite: json["suite"] ?? "",
      city: json["city"] ?? "",
      zipcode: json["zipcode"] ?? "",
      geo: Geo.fromJson(json["geo"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "suite": suite,
      "city": city,
      "zipcode": zipcode,
      "geo": geo,
    };
  }
}

class Geo {
  String lat;
  String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: json["lat"] ?? "", lng: json["lng"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {"lat": lat, "lng": lng};
  }
}
