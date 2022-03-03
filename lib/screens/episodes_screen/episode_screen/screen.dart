import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/screens/setting_screen/widget/series_list_item.dart';
import 'package:rick_morty/source/constants.dart';
import 'package:rick_morty/source/images.dart';
import 'package:rick_morty/source/svg.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({Key? key}) : super(key: key);

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  ScrollController _scrollController = ScrollController();
  double offsetPositive = 0.0;
  double offsetNegative = 1.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          offsetPositive = (_scrollController.offset / 400).clamp(0.0, 1.0);
          if ((1 - (_scrollController.offset / 400).truncateToDouble()) > 0) {
            var val1 =
                (((_scrollController.offset - 0) / (400 - 0)) * (1.0 - 0.0) +
                    0);
            var val2 =
                (((_scrollController.offset - 0) / (400 - 0)) * (1.0 - 0.0) +
                    0);
            if (kDebugMode) {
              print(val1 - val2 % 0.1);
            }
            offsetNegative = 1 - (val1 - val2 % 0.1);
          } else {
            offsetNegative = 0.0;
          }
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: AppColors.darkBlue,
            expandedHeight: 520,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.expand,
              children: [
                BodyAppBar(offset: offsetNegative),
                TitleAppBar(offset: offsetPositive),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.grey,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Персонажи',
                    style: AppTextStyle.textStyle28ww500,
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SeriesList(
                    image: personList[index].image,
                    alive: personList[index].alive,
                    male: personList[index].male,
                    name: personList[index].name,
                    race: personList[index].race,
                  );
                },
                childCount: personList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  final double offset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      child: Opacity(
        opacity: offset,
        child: Column(
          children: const [
            Text(
              'М.Найт',
              style: AppTextStyle.textStyle16w500,
            ),
            Text(
              'Шьямал-Инопланетяне!',
              style: AppTextStyle.textStyle16w500,
            ),
          ],
        ),
      ),
    );
  }
}

class BodyAppBar extends StatelessWidget {
  const BodyAppBar({
    Key? key,
    required this.offset,
  }) : super(key: key);
  final double offset;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            AppImages.seria,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SvgPicture.asset(AppSvg.play),
                    const SizedBox(
                      height: 10,
                    ),
                    Opacity(
                      opacity: offset,
                      child: Column(
                        children: [
                          const Text(
                            'М.Найт',
                            style: AppTextStyle.textStyle2ww500,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Шьямал-Инопланетяне!',
                            style: AppTextStyle.textStyle2ww500,
                          ),
                          const Text(
                            'Серия 1',
                            style: AppTextStyle.textStyle10w500,
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Зигирионцы помещают Джери и Рика в симмуляцию,чтобы узнать рецепт концентрированной черной материи.',
                                  style: AppTextStyle.textStyle13ww500,
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'Премьера',
                                  style: AppTextStyle.textStyle12w500,
                                ),
                                Text(
                                  '2 декабря 2013',
                                  style: AppTextStyle.textStyle17w500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
