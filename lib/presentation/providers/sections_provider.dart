import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/sections_repo.dart';

final _sectionsRepoProvider = Provider<SectionsRepo>((ref) => SectionsRepo());

final sectionsProvider = FutureProvider<List<String>>((ref) async {
  final repo = ref.watch(_sectionsRepoProvider);
  return await repo.fetchSections();
});
