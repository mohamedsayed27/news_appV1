import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cash_helper.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context){
    return BlocProvider.of(context);
  }
  bool isDark = false;
  void changeThemeMode({bool? dark}){
    if(dark!=null) {
      isDark = dark;
      emit(NewsChangeAppModeTheme());
    } else {
      isDark = !isDark;
      CashHelper.putBoolean(key:'isDark', value: isDark).then((value) {
        emit(NewsChangeAppModeTheme());
      });
    }


  }
}
