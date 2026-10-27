import 'package:material_ui/material_ui.dart' show EdgeInsets;

/// Layout spacing constants, all multiples of 5.
/// Used for padding, margins, and edge insets across the application.
///
/// Follows the design system spacing scale where all values are multiples of 5.
abstract class AppSpacing {
  // Horizontal spacings
  static const double horizontalSmall = 5.0;
  static const double horizontalMedium = 10.0;
  static const double horizontalLarge = 20.0;
  static const double horizontalXLarge = 30.0;
  static const double horizontalXXLarge = 40.0;

  // Vertical spacings
  static const double verticalSmall = 5.0;
  static const double verticalMedium = 10.0;
  static const double verticalLarge = 20.0;
  static const double verticalXLarge = 30.0;
  static const double verticalXXLarge = 40.0;

  // Square spacings (for uniform padding/margin)
  static const double spacing5 = 5.0;
  static const double spacing10 = 10.0;
  static const double spacing15 = 15.0;
  static const double spacing20 = 20.0;
  static const double spacing25 = 25.0;
  static const double spacing30 = 30.0;
  static const double spacing35 = 35.0;
  static const double spacing40 = 40.0;
  static const double spacing45 = 45.0;
  static const double spacing50 = 50.0;

  // Edge insets for common UI elements
  static const EdgeInsets padding8 = .all(8.0);
  static const EdgeInsets padding10 = .all(10.0);
  static const EdgeInsets padding15 = .all(15.0);
  static const EdgeInsets padding20 = .all(20.0);
  static const EdgeInsets padding25 = .all(25.0);
  static const EdgeInsets padding30 = .all(30.0);

  static const EdgeInsets symmetricHorizontal10 = .symmetric(horizontal: 10.0);
  static const EdgeInsets symmetricHorizontal20 = .symmetric(horizontal: 20.0);
  static const EdgeInsets symmetricHorizontal30 = .symmetric(horizontal: 30.0);

  static const EdgeInsets symmetricVertical10 = .symmetric(vertical: 10.0);
  static const EdgeInsets symmetricVertical20 = .symmetric(vertical: 20.0);
  static const EdgeInsets symmetricVertical30 = .symmetric(vertical: 30.0);

  // Common button padding
  static const EdgeInsets buttonPadding = .symmetric(
    horizontal: 16.0,
    vertical: 12.0,
  );

  // Common card padding
  static const EdgeInsets cardPadding = .all(16.0);
}

/// Convenience extensions for building edge insets from spacing values.
extension SpacingExtensions on double {
  /// Returns an [EdgeInsets] with this value applied to all sides.
  EdgeInsets get all => .all(this);

  /// Returns an [EdgeInsets] with this value applied to horizontal sides only.
  EdgeInsets get horizontal => .symmetric(horizontal: this);

  /// Returns an [EdgeInsets] with this value applied to vertical sides only.
  EdgeInsets get vertical => .symmetric(vertical: this);
}
