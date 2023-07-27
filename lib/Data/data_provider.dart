import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management_system/Models/user_model.dart';
import 'package:riverpod_state_management_system/Services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});