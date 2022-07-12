import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cash_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'bloc_observer.dart';
import 'cubit_todo/app_cubit.dart';
import 'cubit_todo/app_state.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getData(key:'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
   const MyApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusinessData()..getScienceData()..getSportData(),),
        BlocProvider(create: (BuildContext context)=>AppCubit()..changeThemeMode(dark: isDark),),
      ],
      child: BlocConsumer<AppCubit,AppState>(
          builder: (BuildContext context,AppState state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(

                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.deepPurple,
                floatingActionButtonTheme:  const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepPurple
                ),
                appBarTheme:   const AppBarTheme(
                  titleSpacing: 20,
                    iconTheme: IconThemeData(
                        color: Colors.black
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0.0
                ),
                bottomNavigationBarTheme:   const BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurple,
                  backgroundColor:  Colors.white,
                ),
                textTheme:  const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor:HexColor('333739'),
                primarySwatch: Colors.deepPurple,
                appBarTheme:   AppBarTheme(
                    titleSpacing: 20,
                    iconTheme:   const IconThemeData(
                        color: Colors.white
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor:HexColor('333739') ,
                      statusBarIconBrightness: Brightness.light,
                    ),
                    titleTextStyle:  const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                    backgroundColor: HexColor('333739'),
                    elevation: 0.0
                ),
                bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurple,
                  backgroundColor:  HexColor('333739'),
                ),
                textTheme:  const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

              ),
              themeMode: AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light ,
              home:  const NewsLayout(),
            );
          },
          listener: (context,  state) {}
          ),
    );
  }
}
