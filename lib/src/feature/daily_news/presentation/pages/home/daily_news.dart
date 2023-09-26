import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/src/feature/daily_news/presentation/bloc/article/remote/remote_aricle_bloc.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
      ),
      body: BlocBuilder<RemoteAricleBloc, RemoteAricleState>(
        builder: (context, state) {
          if (state is RemoteAricleLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is RemoteAricleError) {
            return Center(
              child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {},
              ),
            );
          }
          if (state is RemoteAricleDone) {
            return ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, index) {
                final article = state.articles![index];
                return ListTile(
                  title: Text(article.title ?? 'No Title'),
                  subtitle: Text(article.description ?? 'No Description'),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
