import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var searchList =  NewsCubit.get(context).searchList;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    NewsCubit.get(context).searchData(value);
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'You Must Enter anything';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: const Icon(
                          Icons.search
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),

                ),
              ),
              Expanded(child: articleBuilder(searchList,isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
