import 'dart:developer';

import 'package:cubex/features/home/data/service/country_service.dart';
import 'package:cubex/features/home/presentation/controller/bloc/home_event.dart';
import 'package:cubex/features/home/presentation/controller/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final ApiService apiService;

  CountryBloc(this.apiService) : super(CountryInitial()) {
    on<FetchCountries>((event, emit) async {
      emit(CountryLoading());
      try {
        final countries = await apiService.fetchAfricanCountries();
        log('Fetched ${countries.length} countries successfully.');
        emit(CountryLoaded(countries));
      } catch (e, stackTrace) {
        log('Error fetching countries: $e', stackTrace: stackTrace);
        emit(CountryError("Failed to fetch countries"));
      }
    });

    on<FetchCountryDetails>((event, emit) async {
      emit(CountryLoading());
      try {
        final country = await apiService.fetchCountryDetails(event.countryName);
        log('Fetched details for country: ${country.name}');
        emit(CountryDetailsLoaded(country));
      } catch (e, stackTrace) {
        log('Error fetching country details: $e', stackTrace: stackTrace);
        emit(CountryError("Failed to fetch country details"));
      }
    });
  }
}
