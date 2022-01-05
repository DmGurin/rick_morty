import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/source/svg.dart';
import 'package:rick_morty/style/app_colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController(text: " ");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: _controller,
        onSubmitted: (text) {},
        onChanged: (text) {},
        cursorColor: AppColors.grey,
        style: const TextStyle(
          color: AppColors.grey,
        ),
        decoration: InputDecoration(
          suffix: IntrinsicHeight(
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
          prefix: SvgPicture.asset(
            AppSvg.search,
          ),
          fillColor: AppColors.greyLight,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
