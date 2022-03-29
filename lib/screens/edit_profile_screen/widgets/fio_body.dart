import 'package:flutter/material.dart';
import 'package:rick_morty/source/widget/text_filed/main_text_field.dart';

class FioBody extends StatefulWidget {
  const FioBody({Key? key}) : super(key: key);


  @override
  State<FioBody> createState() => _FioBodyState();
}

class _FioBodyState extends State<FioBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        MainTextField(
          value: 'Oleg',
          hintText: 'Введите имя',
          labelText: 'Имя',
        ),
        SizedBox(
          height: 8,
        ),
        MainTextField(
          value: '',
          hintText: 'Введите фамилию',
          labelText: 'Фамилия',
        ),
        SizedBox(
          height: 8,
        ),
        MainTextField(
          value: '',
          hintText: 'Введите отчество',
          labelText: 'Отчество',
        ),
      ],
    );
  }
}
