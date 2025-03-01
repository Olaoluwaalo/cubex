abstract class CountryEvent {}

class FetchCountries extends CountryEvent {}

class FetchCountryDetails extends CountryEvent {
  final String countryName;
  FetchCountryDetails(this.countryName);
}
