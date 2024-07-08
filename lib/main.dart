import 'package:beauty_center/app_theme.dart';
import 'package:beauty_center/application/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:beauty_center/application/authentication/screens/login_screen.dart';
import 'package:beauty_center/application/offers/bloc/bloc/offer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'configure_di.dart';
import 'core/app_store/app_store.dart';
import 'core/local/app_localization.dart';
import 'core/local/language_data_model.dart';
import 'core/local/languages.dart';
import 'core/local/languages/language_en.dart';
import 'core/logic/global_bloc.dart';

BaseLanguage language = LanguageEn();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await getIt<AppStore>().initial();
  configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlobalBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => OfferBloc(),
        ),
      ],
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: Size(getIt<AppStore>().defaultWidth,
                getIt<AppStore>().defaultHeight),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                builder: EasyLoading.init(
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        alwaysUse24HourFormat: false,
                      ),
                      child: child!,
                    );
                  },
                ),
                debugShowCheckedModeBanner: false,
                theme: getAppTheme(context, getIt<AppStore>().isDarkMode),
                localizationsDelegates: const [
                  AppLocalizations(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: LanguageDataModel.languageLocales(),
                localeResolutionCallback: (locale, supportedLocales) => locale,
                locale: Locale(state.languageCode),
                home: const LoginScreen(),
              );
            },
          );
        },
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2500)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = getIt<AppStore>().isDarkMode ? Colors.black : Colors.white
    ..backgroundColor = const Color(0xff2B3C4E)
    ..indicatorColor =
        getIt<AppStore>().isDarkMode ? Colors.black : Colors.white
    ..textColor = getIt<AppStore>().isDarkMode ? Colors.black : Colors.white
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}
