class Country {
  final String name;
  final String capital;
  final String flagUrl;
  final Map<String, dynamic> languages;

  Country({
    required this.name,
    required this.capital,
    required this.flagUrl,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      capital: (json['capital'] as List?)?.first ?? 'N/A',
      flagUrl: json['flags']['png'],
      languages: json['languages'] ?? {},
    );
  }
}
