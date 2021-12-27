import 'package:flutter/material.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    Key? key,
    required this.value,
    required this.labelText,
    required this.hintText,

  }) : super(key: key);
  final String value;
  final String labelText;
  final String hintText;



  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  final TextEditingController _controller = TextEditingController(text: "");

  @override
  void initState() {
    _controller.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppTextStyle.textStyle17w500,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 48,
          child: TextField(
            style: const TextStyle(color: AppColors.grey,),
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              hintStyle: AppTextStyle.textStyle13w500,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              fillColor: AppColors.greyLight,
              hintText: widget.hintText,
            ),
            onChanged: (text) {},
          ),
        ),
      ],
    );
  }
}
