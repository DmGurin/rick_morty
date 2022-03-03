import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/blocs/person_bloc/person_bloc.dart';
import 'package:rick_morty/blocs/person_bloc/person_event.dart';
import 'package:rick_morty/blocs/person_bloc/person_state.dart';
import 'package:rick_morty/screens/persons_screen/widgets/person_grid_item.dart';
import 'package:rick_morty/screens/persons_screen/widgets/person_list_item.dart';
import 'package:rick_morty/source/constants.dart';
import 'package:rick_morty/source/svg.dart';
import 'package:rick_morty/source/widget/text_filed/search_text_field.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  bool _isGrid = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PersonsBloc()..add(InitialPersonsEvent()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.darkBlue,
            title: const SearchTextField(),
          ),
          backgroundColor: AppColors.darkBlue,
          body: BlocConsumer<PersonsBloc, PersonsState>(
            listener: (context, state){
              if (state is LoadingPersonsState){
                const CircularProgressIndicator();
              }
              // if (state is ErrorPersonState){
              //   showCustomSnackBar(
              //     context: context,
              //     type: TypeSnackBar.error,
              //     text: state.error,
              //   );
              // }
            },
            builder: (context, state){
              if (state is DataPersonsState){
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'ВСЕГО ПЕРСОНАЖЕЙ: ${state.persons.length}',
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
                        itemCount: state.persons.length,
                        itemBuilder: (context, index) {
                          return PersonListItem(
                            image: state.persons[index].image,
                            status: state.persons[index].status,
                            gender: state.persons[index].gender,
                            name: state.persons[index].name,
                            species: state.persons[index].species,
                          );
                        },
                      )
                          : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.persons.length,
                        itemBuilder: (context, index) {
                          return PersonGridItem(
                            image: state.persons[index].image,
                            status: state.persons[index].status,
                            gender: state.persons[index].gender,
                            name: state.persons[index].name,
                            species: state.persons[index].species,
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
                );
              }
              return const SizedBox.shrink();
            },
          )),
    );
  }
}
