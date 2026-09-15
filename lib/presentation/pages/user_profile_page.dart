import 'package:ekafitz/core/util/constants.dart';
import 'package:ekafitz/presentation/providers/user/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => UserProfilePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(currentUserProvider(defaultUserKey));

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: asyncUser.when(
            data: (user) {
              return Text(user.toString());
            },
            error: (Object error, StackTrace stackTrace) => Column(
              spacing: 8,
              mainAxisAlignment: .center,
              mainAxisSize: .min,
              children: [
                Text("There was an error trying to get your information"),
                ElevatedButton.icon(
                  onPressed: () {
                    ref.refresh(currentUserProvider(defaultUserKey));
                  },
                  icon: Icon(Icons.refresh),
                  label: Text('Retry'),
                ),
              ],
            ),
            loading: () => CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }
}