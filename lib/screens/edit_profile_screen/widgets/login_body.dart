import 'package:flutter/material.dart';
import 'package:rick_morty/source/widget/text_filed/main_text_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MainTextField(
          value: 'Rick',
          hintText: 'Введите Логин',
          labelText: 'Login',
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
