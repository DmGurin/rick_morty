import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/sourse/images.dart';
import 'package:rick_morty/sourse/svg.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class Sample2 extends StatefulWidget {
  const Sample2({Key? key}) : super(key: key);

  @override
  State<Sample2> createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: AppColors.darkBlue,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 200),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) => ListTile(
                  title: Text("Index: $index"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,

      children: [
        Image.asset(AppImages.seria,
        fit:  BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: const Text(
              "MySliverAppBar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Container(
          height: expandedHeight,
          color: Colors.red,
          child: Positioned(
            top: expandedHeight / 2 - shrinkOffset,
            child: SizedBox(
              height: expandedHeight,
              child: Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: SizedBox(
                  height: 300,
                  child: SizedBox(
                    height: expandedHeight * 2,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(

                          child: SvgPicture.asset(AppSvg.play),
                        ),
                        const Text('М.Найт', style: AppTextStyle.textStyle2ww500),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Шьямал-Инопланетяне!',
                            style: AppTextStyle.textStyle2ww500),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
