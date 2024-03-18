import 'package:intl/intl.dart';

extension StringExtension on String {

  String formatDate() {
    DateTime dateTime = DateTime.parse(this);
    String formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(dateTime);
    return formattedDate;
  }

  String capitalize() {
    return isNotEmpty ? substring(0, 1).toUpperCase() + substring(1) : this;
  }

  String capitalizeAllWords() {
    List<String> words = split(' ');
    List<String> capitalizedWords = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).toList();

    return capitalizedWords.join(' ');
  }

  String formatPhoneNumber() {

    if (length < 8) {
      return this;
    }

    if(length < 9){
      return replaceFirstMapped(
        RegExp(r'(\d{3})(\d{2})(\d{3})'),
            (match) => '+${match[1]} ${match[2]} ${match[3]}',
      );
    }

    return replaceFirstMapped(
      RegExp(r'(\d{3})(\d{2})(\d{3})(\d+)'),
          (match) => '${match[1]} ${match[2]} ${match[3]} ${match[4]}',
    );
  }

}


