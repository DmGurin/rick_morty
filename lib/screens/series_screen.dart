import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/screens/setting_screen/widget/series_list_item.dart';
import 'package:rick_morty/sourse/constans.dart';
import 'package:rick_morty/sourse/images.dart';
import 'package:rick_morty/sourse/svg.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkBlue,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0.0,
              backgroundColor: AppColors.darkBlue,
              expandedHeight: 300,
              //leading: SvgPicture.asset(AppSvg.arrow,
              //height: 10, width: 10,),
              //title: Text('My appbar'),
              //automaticallyImplyLeading: true,
              //primary: true,
              //excludeHeaderSemantics: true,
              //snap: false,
              //stretch: false,
              floating: false,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: 150,
                        width: double.infinity,
                      ),
                      Center(
                          child: Opacity(
                            opacity: 1,
                            child:  Positioned(
                                top: -50,
                                child: SvgPicture.asset(AppSvg.play)),
                          ),
                      ),
                      SizedBox(
                        height: 130,
                        child: Positioned(
                          bottom: 0,
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                //SvgPicture.asset(AppSvg.play),
                                Text('М.Найт',
                                    style: AppTextStyle.textStyle2ww500),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Шьямал-Инопланетяне!',
                                    style: AppTextStyle.textStyle2ww500),
                              ],
                            ),
                          ),
                        ),
                      ),
                     // Positioned(
                      //    top: -50,
                      //    child: SvgPicture.asset(AppSvg.play)),
                    ],
                  ),
                ),
              ),
              flexibleSpace: const FlexibleSpaceBar(
                background: Image(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  image: AssetImage(AppImages.seria),
                  //alignment: Alignment.topCenter,
                ),
                //title: Text('My appbar'),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(24.0),
                //height: double.maxFinite,
                child: Column(
                  children: [
                    //const Text('М.Найт', style: AppTextStyle.textStyle2ww500),
                    //const SizedBox(
                     // height: 10,
                   // ),
                    //const Text('Шьямал-Инопланетяне!',
                        //style: AppTextStyle.textStyle2ww500),
                   // const SizedBox(
                    //  height: 10,
                   // ),
                    const Text(
                      'Серия 1',
                      style: AppTextStyle.textStyle10w500,
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    const Text(
                      'Зигирионцы помещают Джери и Рика в симмуляцию,чтобы узнать рецепт концентрированной черной материи.',
                      style: AppTextStyle.textStyle13ww500,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Премьера',
                          style: AppTextStyle.textStyle12w500,
                        )),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '2 декабря 2013',
                          style: AppTextStyle.textStyle17w500,
                        )),
                    const Divider(
                      height: 50,
                      thickness: 1,
                      color: AppColors.grey,
                    ),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Персонажи',
                          style: AppTextStyle.textStyle28ww500,
                        )),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: personList.length,
                      itemBuilder: (context, index) {
                        return SeriesList(
                          image: personList[index].image,
                          alive: personList[index].alive,
                          male: personList[index].male,
                          name: personList[index].name,
                          race: personList[index].race,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
