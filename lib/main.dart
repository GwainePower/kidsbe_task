import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/app/kidsbe_task.dart';

void main() async {
  runApp(const ProviderScope(child: KidsbeTask()));
}
