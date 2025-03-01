import 'package:cubex/common/generic_screen.dart';
import 'package:cubex/common/textfield.dart';
import 'package:cubex/common/texts.dart';
import 'package:cubex/features/home/data/models/country_model.dart';
import 'package:cubex/features/home/data/service/country_service.dart';
import 'package:cubex/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:cubex/features/home/presentation/controller/bloc/home_event.dart';
import 'package:cubex/features/home/presentation/controller/bloc/home_state.dart';
import 'package:cubex/features/home/presentation/screens/country_details_screen.dart';
import 'package:cubex/features/home/presentation/widgets/loader.dart';
import 'package:cubex/features/home/presentation/widgets/reload_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key, required this.name});
  final String name;
  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterCountries);
  }
void _filterCountries() {
  final query = _searchController.text.toLowerCase();
  setState(() {
    if (query.isEmpty) {
      _filteredCountries = _allCountries;
    } else {
      _filteredCountries = _allCountries
          .where((country) => country.name.toLowerCase().contains(query))
          .toList();
    }
  });
}


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      child: BlocProvider(
          create: (context) => CountryBloc(ApiService())..add(FetchCountries()),
          child: BlocBuilder<CountryBloc, CountryState>(
            builder: (context, state) {
              if (state is CountryLoading) {
                return const Loader();
              } else if (state is CountryLoaded) {
                _allCountries = state.countries;
                _filteredCountries = _filteredCountries.isEmpty
                    ? _allCountries
                    : _filteredCountries;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    boldText(text: "Welcome ${widget.name}"),
                    SizedBox(
                      height: 3.h,
                    ),
                    lightText(
                      text: "Select your country",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CTextfield(
                      controller: _searchController,
                      hintText: "Search your country",
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200.h,
                      width: double.infinity,
                      child: _filteredCountries.isEmpty
                          ? Center(
                              child: lightText(
                                text: "No country found with that name.",
                                fontSize: 16.sp,
                                color: Colors.grey,
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: _filteredCountries.length,
                              itemBuilder: (context, index) {
                                var country = _filteredCountries[index];
                                return ListTile(
                                  leading: Image.network(country.flagUrl,
                                      width: 50, height: 50),
                                  title: Text(country.name),
                                  subtitle: Text('Capital: ${country.capital}'),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetailScreen(
                                                countryName: country.name),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                );
              } else if (state is CountryError) {
                return ReloadButton(
                  errorMessage: "An error occurred: ${state.message}",
                  onReload: () {
                    context.read<CountryBloc>().add(FetchCountries());
                  },
                );
              }

              return const Center(child: Text('No data available'));
            },
          )),
    );
  }
}

