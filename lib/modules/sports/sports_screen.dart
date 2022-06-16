import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';

import '../../components.dart';
  @override
class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sportList = NewsCubit.get(context).sportList;

    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (BuildContext context, NewsStates state)=>  articleBuilder(sportList),
      listener:(BuildContext context, NewsStates state){

      } ,
    );
  }
}
