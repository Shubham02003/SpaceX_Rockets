class Rocket {
  final String name;
  final String country;
  final int enginesCount;
  final String flickrImage;

  Rocket({
    required this.name,
    required this.country,
    required this.enginesCount,
    required this.flickrImage,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      name: json['name'] ?? "",
      country: json['country'] ?? "",
      enginesCount: json['engines']['number'] ?? "",
      flickrImage:
          json['flickr_images'].isNotEmpty ? json['flickr_images'][0] : '',
    );
  }
}
