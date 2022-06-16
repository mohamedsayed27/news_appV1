import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());
   static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screen =[
      const BusinessScreen(),
      const ScienceScreen(),
      const SportsScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
      const BottomNavigationBarItem(
        icon:Icon(Icons.business),
        label: "Business"
    ),
      const BottomNavigationBarItem(
        icon:Icon(Icons.science_outlined),
          label: "Science"

      ),
     const BottomNavigationBarItem(
        icon:Icon(Icons.sports_basketball),
         label: "Sports"

     ),

  ];
  void changeBottomNavBar (int index){
    currentIndex = index;
    emit(NewsBottomNavStates());
  }
  List<dynamic> businessList = [];
  void  getBusinessData(){
    emit(LoadingBusinessData());
     DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'11e31ea3e56142d98835f82b0f39bd7c',

        }).then((value) {
      businessList = value.data['articles'];
      emit(NewsGetBusinessDataSuccessState());
    }).catchError((error)
    {
      emit(NewsGetBusinessDataErrorState(error.toString()));
    });
  }
  List<dynamic> scienceList = [];
  void getScienceData(){
    emit(LoadingScienceData());
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'science',
              'apiKey':'11e31ea3e56142d98835f82b0f39bd7c',

            }).then((value) {
          scienceList = value.data['articles'];
          emit(NewsGetScienceDataSuccessState());
        }).catchError((error)
        {

          emit(NewsGetScienceDataErrorState(error.toString()));
        });


  }
  List<dynamic> sportList = [];
  void getSportData(){
    emit(LoadingSportData());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'11e31ea3e56142d98835f82b0f39bd7c',

          }).then((value) {
        sportList = value.data['articles'];
        emit(NewsGetSportDataSuccessState());
      }).catchError((error)
      {
        emit(NewsGetSportDataErrorState(error.toString()));
      });


  }
  List<dynamic> searchList = [];
  void searchData(String value){
    emit(LoadingSearchData());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':value,
          'apiKey':'11e31ea3e56142d98835f82b0f39bd7c',

        }).then((value) {
      searchList = value.data['articles'];
      emit(NewsGetSearchDataSuccessState());
    }
    ).catchError((error)
    {
      emit(NewsGetSearchDataErrorState(error.toString()));
    });
  }

}
