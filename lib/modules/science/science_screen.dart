import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import '../../components.dart';
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var scienceList = NewsCubit.get(context).scienceList;

    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (BuildContext context, NewsStates state)=>  articleBuilder(scienceList),
      listener:(BuildContext context, NewsStates state){

      } ,
    );
  }
}
