import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_mood/core/theme/cubit/theme_cubit.dart';
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
        BlocProvider(create: (context) => ThemeCubit()..loadSavedTheme()),
      ],
      child: BlocBuilder<LocaleCubit, String>(
        builder: (context, lacale) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Good Mood',
                localizationsDelegates: LocaleCubit.localizationsDelegates,
                locale: Locale('en'),
                supportedLocales: S.delegate.supportedLocales,
                theme: context.watch<ThemeCubit>().currentTheme(),
                home: SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
