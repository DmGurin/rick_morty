import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/screens/location_screen/widgets/location_item.dart';
import 'package:rick_morty/sourse/constans.dart';
import 'package:rick_morty/sourse/svg.dart';
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
        title: TextField(
          onSubmitted: (text) {
          },
          cursorColor: AppColors.grey,
          style: const TextStyle(
            color: AppColors.grey,
          ),
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(22.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const VerticalDivider(
                      color: AppColors.grey,
                      thickness: 1,
                      width: 1,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    SvgPicture.asset(
                      AppSvg.filter,
                    ),
                  ],
                ),
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(19.0),
              child: SvgPicture.asset(
                AppSvg.search,
              ),
            ),
            fillColor: AppColors.greyLight,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
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
