import 'package:intl/intl.dart';

String formatDate({required String date}) {
  // convert string date to DateTime format
  final DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
  return formattedDate;
}
