import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiary/models/activity.dart';
import 'package:idiary/provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Activity> activity = ref.watch(activityProvider);
    return Center(
      child: switch (activity) {
        AsyncData(:final value) => Text('Activity: ${value.activity}'),
        AsyncError() => const Text('oops, something unexpected happended'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
