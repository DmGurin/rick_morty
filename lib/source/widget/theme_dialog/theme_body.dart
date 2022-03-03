import 'package:flutter/material.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class ThemeBody extends StatefulWidget {
  const ThemeBody({Key? key}) : super(key: key);

  @override
  _ThemeBodyState createState() => _ThemeBodyState();
}

class _ThemeBodyState extends State<ThemeBody> {
  String? selectedValue = 'Выключено';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Темная тема',
            style: AppTextStyle.textStyle28ww500,
          ),
          RadioListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            activeColor: Colors.blue,
            title: const Text(
              'Выключена',
              style: AppTextStyle.textStyle24w500,
            ),
            onChanged: (value) {
              setState(() {
                selectedValue = value! as String?;
                Navigator.pop(context);
              });
            },
            value: 'Выключена',
            groupValue: selectedValue,
          ),
          RadioListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            activeColor: Colors.blue,
            title: const Text(
              'Включена',
              style: AppTextStyle.textStyle24w500,
            ),
            onChanged: (value) {
              setState(() {
                selectedValue = value! as String?;
              });
            },
            value: 'Включена',
            groupValue: selectedValue,
          ),
          RadioListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            activeColor: Colors.blue,
            title: const Text(
              'Следовать настройкам системы',
              style: AppTextStyle.textStyle24w500,
            ),
            onChanged: (value) {
              setState(() {
                selectedValue = value! as String?;
              });
            },
            value: 'Следовать настройкам системы',
            groupValue: selectedValue,
          ),
          RadioListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            activeColor: Colors.blue,
            title: const Text(
              'В режиме энергосбережения',
              style: AppTextStyle.textStyle24w500,
            ),
            onChanged: (value) {
              setState(() {
                selectedValue = value! as String?;
              });
            },
            value: 'В режиме энергосбережения',
            groupValue: selectedValue,
          ),
          const SizedBox(
            height: 24,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Оk',
                style: AppTextStyle.textStyle24w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
