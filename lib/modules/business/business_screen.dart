import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';

import '../../components.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        builder: ( context,  state)  {
          var businessList =  NewsCubit.get(context).businessList;
          return articleBuilder(businessList);
        },
        listener:( context,  state){
        } ,
     );
  }
//  ConditionalBuilder(
//         condition: true,
//         builder: (BuildContext context){
//           return articleItemBuilder();
//         },
//         fallback:(BuildContext context)=> const Center(child: CircularProgressIndicator()) ,
//     );
}
