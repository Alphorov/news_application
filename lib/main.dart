import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/src/config/theme/app_themes.dart';
import 'package:news_application/src/feature/daily_news/presentation/bloc/article/remote/remote_aricle_bloc.dart';
import 'package:news_application/src/feature/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_application/src/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteAricleBloc>(
      create: (context) => sl()..add(const RemoteAricleFetch()),
      child: MaterialApp(
        theme: theme(),
        home: const DailyNewsPage(),
        builder: (context, child) => child!,
      ),
    );
  }
}
