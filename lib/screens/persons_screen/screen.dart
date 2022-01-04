import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/screens/persons_screen/widgets/person_grid_item.dart';
import 'package:rick_morty/screens/persons_screen/widgets/person_list_item.dart';
import 'package:rick_morty/source/constants.dart';
import 'package:rick_morty/source/svg.dart';
import 'package:rick_morty/source/widget/text_filed/search_text_field.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  bool _isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          title: const SearchTextField(),
        ),
        backgroundColor: AppColors.darkBlue,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
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
                  GestureDetector(
                    child:
                        SvgPicture.asset(_isGrid ? AppSvg.grid : AppSvg.list),
                    onTap: () {
                      setState(() {
                        _isGrid = !_isGrid;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _isGrid
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: personList.length,
                      itemBuilder: (context, index) {
                        return PersonListItem(
                          image: personList[index].image,
                          alive: personList[index].alive,
                          male: personList[index].male,
                          name: personList[index].name,
                          race: personList[index].race,
                        );
                      },
                    )
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: personList.length,
                      itemBuilder: (context, index) {
                        return PersonGridItem(
                          image: personList[index].image,
                          alive: personList[index].alive,
                          male: personList[index].male,
                          name: personList[index].name,
                          race: personList[index].race,
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 2 / 2.55,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                    ),
            ],
          ),
        ));
  }
}
