
import 'package:flutter/material.dart';
import 'package:rick_morty/sourse/widget/main_text_field.dart';

class FioBody extends StatelessWidget{
  const FioBody ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Column(
     children: const [
       MainTextField(value: 'Oleg', hintText: 'Введите имя', labelText: 'Имя',),
       SizedBox(
         height: 8,
       ),
       MainTextField(value: '', hintText: 'Введите фамилию', labelText: 'Фамилия',),
       SizedBox(
         height: 8,
       ),
       MainTextField(value: '', hintText: 'Введите отчество', labelText: 'Отчество',),
     ],
   );
  }
}