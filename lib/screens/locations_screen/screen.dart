import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/location_bloc/location_bloc.dart';
import 'package:rick_morty/blocs/location_bloc/location_event.dart';
import 'package:rick_morty/blocs/location_bloc/location_state.dart';
import 'package:rick_morty/screens/locations_screen/widgets/location_item.dart';
import 'package:rick_morty/source/widget/text_filed/search_text_field.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationBloc()..add(InitialLocationEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          title: const SearchTextField(),
        ),
        backgroundColor: AppColors.darkBlue,
        body: BlocConsumer<LocationBloc, LocationState>(
          listener: (context, state) {
            if (state is LoadingLocationState) {
              const CircularProgressIndicator();
            }
          },
          builder: (context, state) {
            if (state is DataLocationState) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'ВСЕГО ПЕРСОНАЖЕЙ: ${state.locations.length}',
                          style: AppTextStyle.textStyle16w500.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.locations.length,
                      itemBuilder: (context, index) {
                        return LocationItem(
                          image: state.locations[index].image!,
                          name: state.locations[index].name,
                          type: state.locations[index].type!,
                          dimension: state.locations[index].dimension!,
                        );
                      },
                    )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
