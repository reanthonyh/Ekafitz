import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/core/util/constants.dart';
import 'package:ekafitz/presentation/providers/user/user_profile_provider.dart';
import 'package:ekafitz/presentation/widgets/user/user_card_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => UserProfilePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = EkafitzDictionary.of(context)!;
    final asyncUser = ref.watch(currentUserProvider(defaultUserKey));

    return Scaffold(
      appBar: AppBar(title: Text(intl.personal_info_title)),
      body: SafeArea(
        child: asyncUser.when(
          data: (user) {
            return ListView(
              padding: const .symmetric(horizontal: 15, vertical: 10),
              children: [UserCardHeader(user), Divider()],
            );
          },
          error: (error, stackTrace) => Column(
            spacing: 16,
            mainAxisAlignment: .center,
            mainAxisSize: .min,
            children: [
              Text("There was an error trying to get your information"),
              ElevatedButton.icon(
                onPressed: () => ref.invalidate(currentUserProvider),
                icon: Icon(Icons.refresh),
                label: Text('Retry'),
              ),
            ],
          ),
          loading: () => Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}
