import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/articles_provider.dart';
import '../providers/sections_provider.dart';

import '../widgets/article_list_item.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/error_button.dart';
import '../widgets/article_search_delegate.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildSectionsList(List<String> sections, WidgetRef ref) => SizedBox(
        width: 300,
        height: 300,
        child: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                thickness: 1,
              ),
              ListTile(
                title: Text(sections[index]),
                onTap: () {
                  ref.read(currentSectionProvider.notifier).state =
                      sections[index];
                  ref.refresh(articlesStreamProvider);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesList = ref.watch(articlesStreamProvider);
    final sectionsList = ref.watch(sectionsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('The New York Times'),
        actions: [
          sectionsList.when(
            data: (sections) => IconButton(
              icon: const Icon(Icons.tune),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Filter by section',
                    textAlign: TextAlign.center,
                  ),
                  content: _buildSectionsList(sections, ref),
                  actions: [
                    TextButton(
                      onPressed: () {
                        ref.read(currentSectionProvider.notifier).state = 'all';
                        ref.refresh(articlesStreamProvider);
                        Navigator.of(context).pop();
                      },
                      child: const Text('View all'),
                    ),
                  ],
                ),
              ),
            ),
            error: (error, _) => ErrorButton(
              item: 'sections',
              errorMessage: error.toString(),
              onPressFunction: () {
                ref.refresh(sectionsProvider);
                Navigator.of(context).pop();
              },
            ),
            loading: () => const Icon(Icons.tune),
          ),
          articlesList.when(
            data: (articles) => IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => showSearch(
                context: context,
                delegate: ArticleSearchDelegate(articles: articles),
              ),
            ),
            error: (error, _) => ErrorButton(
              item: 'articles',
              errorMessage: error.toString(),
              onPressFunction: () {
                ref.refresh(articlesStreamProvider);
                Navigator.of(context).pop();
              },
            ),
            loading: () => const Icon(Icons.search),
          ),
        ],
      ),
      body: articlesList.when(
        data: (articles) => RefreshIndicator(
          onRefresh: () async => await ref.refresh(articlesStreamProvider),
          child: articles.isNotEmpty
              ? ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      ArticleListItem(article: articles[index]),
                )
              : const Center(
                  child: Text('Nothing, try to refresh'),
                ),
        ),
        error: (error, stackTrace) =>
            ErrorMessageWidget(errorText: error.toString()),
        loading: () => const LoadingWidget(),
      ),
    );
  }
}
