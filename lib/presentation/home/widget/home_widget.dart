import 'package:intl/intl.dart';

String getTimeDifference(DateTime postedOn) {
  final now = DateTime.now();
  final difference = now.difference(postedOn);
  print(difference);
  if (difference.inMinutes <= 5) {
    return 'NOW';
  } else if (difference.inHours < 1) {
    return '${difference.inMinutes} Min';
  } else if (difference.inDays < 1) {
    return '${difference.inHours} Hr';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} D';
  } else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    return '$months M';
  } else {
    int years = (difference.inDays / 365).floor();
    return '$years Y';
  }
}

DateTime _parseDateString(String dateString) {
  try {
    final DateFormat formatter = DateFormat('d MMM yyyy');
    return formatter.parse(dateString);
  } catch (e) {
    print('Error parsing date: $dateString');
    return DateTime.now();
  }
}
