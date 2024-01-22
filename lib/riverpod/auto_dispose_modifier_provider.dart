import 'package:riverpod/riverpod.dart';

final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return [1, 2, 3, 4, 5];
});
