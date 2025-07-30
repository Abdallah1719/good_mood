import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_mood/features/splash/presentation/screens/splash_screen.dart';
import 'package:good_mood/generated/l10n.dart';
import 'package:good_mood/l10n/cubit/local_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()..loadSavedLocale()),
      ],
      child: BlocBuilder<LocaleCubit, String>(
        builder: (context, lacale) {
          return MaterialApp(
            title: 'Flutter Demo',
            localizationsDelegates: LocaleCubit.localizationsDelegates,
            locale: Locale('en'),
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
