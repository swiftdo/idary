import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'models/activity.dart';

part 'provider.g.dart';

@riverpod
Future<Activity> activity(ActivityRef ref) async {
  try {
    final response = await http.get(Uri.https('boredapi.com', '/api/activity'));
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Activity.fromJson(json);
  } catch (e, s) {
    print('$e - $s');
    rethrow;
  }
}
