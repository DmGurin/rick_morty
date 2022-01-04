import 'package:flutter/material.dart';
import 'package:rick_morty/screens/locations_screen/widgets/location_item.dart';
import 'package:rick_morty/source/constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: const SearchTextField(),
      ),
      backgroundColor: AppColors.darkBlue,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'ВСЕГО ПЕРСОНАЖЕЙ: ${personList.length}',
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
              itemCount: locationList.length,
              itemBuilder: (context, index) {
                return LocationItem(
                  image: locationList[index].image,
                  nameLocation: locationList[index].nameLocation,
                  typeLocation: locationList[index].typeLocation,
                  dimension: locationList[index].dimension,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
