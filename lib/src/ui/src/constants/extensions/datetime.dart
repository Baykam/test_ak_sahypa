import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  /// DateTime nesnesini "Jun 15, 2026, 12:29 PM" formatında String'e çevirir.
  String toReadableString() {
    final localDateTime = toLocal();

    return DateFormat('MMM d, yyyy, h:mm a', 'en_US').format(localDateTime);
  }
}