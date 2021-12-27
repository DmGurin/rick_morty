import 'package:flutter/material.dart';
import 'package:rick_morty/screens/person_screen/widgets/person_grid_item.dart';
import 'package:rick_morty/screens/person_screen/widgets/person_list_item.dart';
import 'package:rick_morty/sourse/constans.dart';
import 'package:rick_morty/sourse/svg.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  bool _isGrid = false;
  final TextEditingController _controller = TextEditingController(text: " ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          title: TextField(
            onSubmitted: (text) {
            },
            onChanged: (text){},
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
            controller: _controller,
          ),
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
