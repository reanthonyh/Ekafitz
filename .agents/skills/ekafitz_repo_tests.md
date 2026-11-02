---
name: ekafitz-repo-tests
description: Write Flutter repository tests for the ekafitz project using drift's in-memory database. Use when adding or changing tests under test/data/repositories/ or any test that touches EkafitzDatabase.
---

# Writing repository tests (ekafitz)

## Setup pattern

Every test file that uses the database follows the same shape:

- `setUp` creates a new `EkafitzDatabase` backed by `NativeDatabase.memory()` with `closeStreamsSynchronously: true`.
- `tearDown` closes the database.
- Each test gets a fresh, empty database. Data never carries over between tests.

```dart
late EkafitzDatabase db;

setUp(() {
  db = EkafitzDatabase(
    DatabaseConnection(
      NativeDatabase.memory(),
      closeStreamsSynchronously: true,
    ),
  );
});

tearDown(() async {
  await db.close();
});
```

## Rule: each test arranges its own data

Because the database is empty before every test, a test that reads data must insert that data itself. Do not depend on another test having run first.

- Put inserts in a helper (for example `insertTestUser()`) and call it at the start of each test that needs the row.
- Use the Arrange / Act / Assert order and keep the Arrange step visible.
- If most tests in a group need the same row, call the helper in `setUp` with `async`, for example `setUp(() async { ... })`.

## Test structure

```dart
group("Local User Repo", () {
  test("saveUser returns the new row id", () async {
    // Arrange
    // (no data needed)

    // Act
    final id = await insertTestUser();

    // Assert
    expect(id, 1);
  });

  test("watchUserWithId emits the saved user", () async {
    // Arrange
    await insertTestUser();

    // Act
    final user = await db.watchUserWithId('000').first;

    // Assert
    expect(user.fullName, "Nombre Apellido");
  });
});
```

## Naming

- Describe the behavior, not the method: "watchUserWithId emits the saved user", not "Exist Users Test".
- Group by repository or DAO name.

## Testing streams (watch* methods)

- Use `.first` when you want the current value.
- For changes over time, use `expectLater` with `emitsInOrder`, and call the write after subscribing.
- Always await the write that should trigger the emission.

## Testing errors and missing rows

- A `watch*` method that expects exactly one row throws `Bad state: Expected exactly one element` when there are zero rows. Test the empty case on purpose if the app relies on it, and catch the error or check for null depending on what the repository promises.
- Test duplicate inserts or unique constraint failures with `expect(() => ..., throwsA(isA<...>()))`.

## Checklist before merging a new test

- [ ] `setUp` and `tearDown` are present, and the database is closed.
- [ ] Each test inserts the data it reads.
- [ ] Test names describe behavior.
- [ ] No test depends on the order of other tests.
- [ ] Run with `flutter test test/data/repositories/` and check that all tests pass when run alone with `--plain-name`.

## Running tests

```bash
flutter test                                  # all tests
flutter test test/data/repositories/          # repository tests only
flutter test --plain-name "saveUser returns"  # one test
```
