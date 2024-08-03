import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/core/helper/wifi_helper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_challenge/core/preference/preference.dart';
import 'package:flutter_challenge/core/routes/app_routes.dart';
import 'package:flutter_challenge/core/services_locator/services_locator.dart';
import 'package:flutter_challenge/core/theme/app_theme.dart';
import 'package:flutter_challenge/presentation/bottom_navigation_bar/bloc/bloc_navigation/navigation_bloc.dart';
import 'package:flutter_challenge/presentation/setting/bloc/setting_bloc/setting_bloc.dart';
import 'package:flutter_challenge/presentation/simpson/bloc/simpson_bloc/simpson_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "envs/.env");
  serviceLocatorInit();
  await WifiHelper.init();
  await Preferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SimpsonBloc(),
        ),
        BlocProvider(
          create: (_) => NavigationBloc(),
        ),
        BlocProvider(
          create: (_) => SettingBloc(),
        ),
      ],
      child: Builder(builder: (context) {
        
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          theme: context.watch<SettingBloc>().state.isLight
              ? AppTheme().getLightTheme()
              : AppTheme().getDarkTheme(),
          routes: AppRoutes.routes,
          initialRoute: AppRoutes.initialRoute,
        );
      }),
    );
  }
}
