abstract class NewsStates{}
class NewsInitialStates extends NewsStates{}
class NewsBottomNavStates extends NewsStates{}
class LoadingBusinessData extends NewsStates{}
class NewsGetBusinessDataSuccessState extends NewsStates{}
class NewsGetBusinessDataErrorState extends NewsStates{
  late final String error;
  NewsGetBusinessDataErrorState(this.error);
}
class LoadingSportData extends NewsStates{}
class NewsGetSportDataSuccessState extends NewsStates{}
class NewsGetSportDataErrorState extends NewsStates{
  late final String error;
  NewsGetSportDataErrorState(this.error);
}
class LoadingScienceData extends NewsStates{}
class NewsGetScienceDataSuccessState extends NewsStates{}
class NewsGetScienceDataErrorState extends NewsStates{
  late final String error;
  NewsGetScienceDataErrorState(this.error);
}
class LoadingSearchData extends NewsStates{}
class NewsGetSearchDataSuccessState extends NewsStates{}
class NewsGetSearchDataErrorState extends NewsStates{
  late final String error;
  NewsGetSearchDataErrorState(this.error);
}


//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=11e31ea3e56142d98835f82b0f39bd7c
