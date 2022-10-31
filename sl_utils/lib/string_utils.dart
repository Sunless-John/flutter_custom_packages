extension StringExtension on String {
  String capitalize({lowerRemainingLetters = false}) {    
      if (lowerRemainingLetters) {
        return this[0].toUpperCase() + substring(1).toLowerCase();
      } else {
        return this[0].toUpperCase() + substring(1);
      }
  }

  // List<String?> splitToWords({String customPattern = ''}) {
  //   if (isEmpty) {
  //     return [];
  //   }

  //   return customPattern.allMatches(this).map((m) => m.group(0)).toList();
  // }

  // String camelCase()
  // {
  //   final List<String> splittedString = split(' ');

  //   if (splittedString.isEmpty) {
  //     return '';
  //   }

  //   String _firstWord = splittedString[0].toLowerCase();
  //   List<String> _restWords = splittedString
  //       .sublist(1)
  //       .map((String x) => capitalize(lowerRemainingLetters:true))
  //       .toList();

  //   return _firstWord + _restWords.join('');
  // }
}