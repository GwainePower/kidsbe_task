import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/articles_repo.dart';
import '../../domain/models/article.dart';

final _articlesRepoProvider = Provider<ArticlesRepo>((ref) => ArticlesRepo());

final articlesStreamProvider = StreamProvider.autoDispose<List<Article>>(
  (ref) async* {
    final section = ref.watch(currentSectionProvider);
    final repo = ref.watch(_articlesRepoProvider);
    while (true) {
      yield await repo.fetchArticles(section);
      await Future.delayed(const Duration(seconds: 30));
    }
  },
);

final currentSectionProvider = StateProvider<String>((ref) => 'all');
