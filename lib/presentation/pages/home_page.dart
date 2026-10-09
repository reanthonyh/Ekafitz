import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/core/util/constants.dart';
import 'package:ekafitz/core/util/extensions.dart';
import 'package:ekafitz/domain/entities.dart';
import 'package:ekafitz/domain/usecases.dart';
import 'package:ekafitz/presentation/pages/training_program/training_program_list_page.dart';
import 'package:ekafitz/presentation/pages/user_profile_page.dart';
import 'package:ekafitz/presentation/pages/workout/workout_list_page.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GetUserUseCase _getUserUseCase;
  late final SaveUserUseCase _saveUserUseCase;

  User? _user;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    final getIt = GetIt.I;

    _getUserUseCase = getIt<GetUserUseCase>();
    _saveUserUseCase = getIt<SaveUserUseCase>();

    _loadOrCreateUser();

    super.initState();
  }

  Future<void> _loadOrCreateUser() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final user = await _getUserUseCase.call(userId: defaultUserKey);
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      final defaultUser = User(
        id: defaultUserKey,
        fullName: 'Default Name',
        email: 'default@example.com',
        birthDate: DateTime(1990, 1, 1),
        gender: Gender.male,
        passwordHash: 'default_hash',
        createdAt: DateTime.now(),
        updatedAt: null,
      );
      try {
        await _saveUserUseCase.call(user: defaultUser);
        setState(() {
          _user = defaultUser;
          _isLoading = false;
        });
      } catch (saveError) {
        setState(() {
          _error = saveError.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final intl = EkafitzDictionary.of(context)!;

    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const .all(24),
            child: Column(
              mainAxisSize: .min,
              spacing: 16,
              children: [
                const Icon(Icons.error_outline, size: 48),
                Text(_error!, textAlign: TextAlign.center),
                ElevatedButton.icon(
                  onPressed: _loadOrCreateUser,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.home_title),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const .symmetric(horizontal: 20, vertical: 24),
          children: [
            if (_user != null)
              Text(
                _user!.fullName,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: .w600,
                ),
              ),
            const SizedBox(height: 24),
            _HomeNavCard(
              icon: Icons.person,
              title: intl.home_user_profile_title,
              subtitle: intl.home_user_profile_subtitle,
              onTap: () =>
                  Navigator.of(context).push(UserProfilePage.route()),
            ),
            const SizedBox(height: 12),
            _HomeNavCard(
              icon: Icons.fitness_center,
              title: intl.home_workouts_title,
              subtitle: intl.home_workouts_subtitle,
              onTap: () =>
                  Navigator.of(context).push(WorkoutListPage.route()),
            ),
            const SizedBox(height: 12),
            _HomeNavCard(
              icon: Icons.calendar_month,
              title: intl.home_training_programs_title,
              subtitle: intl.home_training_programs_subtitle,
              onTap: () =>
                  Navigator.of(context).push(TrainingProgramListPage.route()),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeNavCard extends StatelessWidget {
  const _HomeNavCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textTheme = context.textTheme;

    return Card(
      clipBehavior: .antiAlias,
      child: ListTile(
        contentPadding: const .symmetric(horizontal: 16, vertical: 8),
        onTap: onTap,
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: colorScheme.primaryContainer,
          child: Icon(icon, color: colorScheme.onPrimaryContainer),
        ),
        title: Text(
          title,
          style: textTheme.titleMedium?.copyWith(fontWeight: .w600),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
