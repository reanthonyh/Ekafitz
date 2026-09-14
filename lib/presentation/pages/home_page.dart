import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ekafitz/domain/usecases.dart';
import 'package:ekafitz/domain/entities.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

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
      // Try to get user with a fixed id (could be from auth)
      final userId = 'default_user';
      final user = await _getUserUseCase.call(userId: userId);
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      // If not found, create and save a default user
      final defaultUser = User(
        id: 'default_user',
        fullName: 'Default User',
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
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_error != null) {
      return Scaffold(body: Center(child: Text('Error: $_error')));
    }
    return Scaffold(
      body: Center(
        child: _user != null
            ? Text('User: ${_user!.fullName} (${_user!.email})')
            : const Text('No user'),
      ),
    );
  }
}
