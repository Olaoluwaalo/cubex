import 'package:cubex/common/generic_screen.dart';
import 'package:cubex/common/texts.dart';
import 'package:cubex/core/constants/colors.dart';
import 'package:cubex/features/home/data/service/country_service.dart';
import 'package:cubex/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:cubex/features/home/presentation/controller/bloc/home_event.dart';
import 'package:cubex/features/home/presentation/controller/bloc/home_state.dart';
import 'package:cubex/features/home/presentation/widgets/loader.dart';
import 'package:cubex/features/home/presentation/widgets/reload_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetailScreen extends StatelessWidget {
  final String countryName;
  const CountryDetailScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: boldText(
          text: countryName,
          fontSize: 20.sp,
          color: Colors.white,
        ),
        backgroundColor: CColors.buttonColor,
      ),
      child: BlocProvider(
        create: (context) =>
            CountryBloc(ApiService())..add(FetchCountryDetails(countryName)),
        child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoading) {
              return const Loader();
            } else if (state is CountryDetailsLoaded) {
              var country = state.country;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.network(country.flagUrl,
                          width: 100, height: 100)),
                  const SizedBox(height: 20),
                  boldText(
                      text: 'Name: ${country.name}',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  lightText(text: 'Capital: ${country.capital}', fontSize: 16),
                  lightText(
                      text: 'Languages: ${country.languages.values.join(", ")}',
                      fontSize: 16),
                ],
              );
            } else if (state is CountryError) {
              return ReloadButton(
                errorMessage: "An error occurred: ${state.message}",
                onReload: () {
                  context
                      .read<CountryBloc>()
                      .add(FetchCountryDetails(countryName));
                },
              );
            }
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
