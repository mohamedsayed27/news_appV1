import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/cubit_todo/app_cubit.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/search/search.dart';
class NewsLayout extends StatelessWidget {
   const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, Object? state) {
      },
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          body: cubit.screen[cubit.currentIndex],
          appBar: AppBar(
            title:  const Text("News App"),
            actions: [Padding(
              padding:  const EdgeInsets.only(top: 7),
              child: IconButton(
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
                icon:  const Icon(Icons.search),
                iconSize: 30,),
            ),
              Padding(
                padding:  const EdgeInsets.only(right: 10,top: 7),
                child: IconButton(
                  onPressed: ()
                  {
                    AppCubit.get(context).changeThemeMode();
                  },
                  icon:  const Icon(Icons.brightness_4_outlined),iconSize: 25,),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (indx)  {
              cubit.changeBottomNavBar(indx);
            },
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
