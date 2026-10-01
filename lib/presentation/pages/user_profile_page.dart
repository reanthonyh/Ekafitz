import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/core/util/constants.dart';
import 'package:ekafitz/core/util/extensions.dart';
import 'package:ekafitz/presentation/providers/user/user_profile_provider.dart';
import 'package:ekafitz/presentation/widgets/user/user_card_header.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => UserProfilePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = context.colors;
    final textTheme = context.textTheme;

    final intl = EkafitzDictionary.of(context)!;
    final asyncUser = ref.watch(currentUserProvider(defaultUserKey));

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.personal_info_title),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: asyncUser.when(
          data: (user) {
            return ListView(
              padding: const .symmetric(horizontal: 20, vertical: 24),
              children: [
                UserCardHeader(user),
                const SizedBox(height: 24),
                // Additional profile sections could go here
              ],
            );
          },
          error: (error, stackTrace) => Center(
            child: Padding(
              padding: const .all(24),
              child: Column(
                mainAxisSize: .min,
                spacing: 24,
                children: [
                  Icon(Icons.error_outline, size: 48, color: colorScheme.error),
                  Text(
                    "There was an error trying to get your information",
                    style: textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton.icon(
                    onPressed: () => ref.invalidate(currentUserProvider),
                    icon: const Icon(Icons.refresh),
                    label: Text('Retry'),
                    style: ElevatedButton.styleFrom(
                      padding: const .symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}
