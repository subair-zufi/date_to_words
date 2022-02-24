library date_to_words;

class DateToWord {
  DateToWord._internal();

  static DateToWord instance = DateToWord._internal();

  factory DateToWord() => DateToWord._internal();

  /// Converts Dates to word in following format <Month Day+ Ordinal>+<Month>+<Year>;
  ///
  /// This method extract year, month and day from the input date time.
  /// The extracted values are converted to words
  ///
  String convert(DateTime value) {
    final _year= value.year;
    final _month= value.month;
    final _monthDay= value.day;
    final _result= '${numWithOrdinal(_monthDay)} ${monthInWord(_month)} ${numToWord(_year)}';
    return _result;
  }

  /// Converts number to word
  String numToWord(int number) {
    var str = '';
    String numberString = '0000000000' + number.toString();
    numberString =
        numberString.substring(number.toString().length, numberString.length);
    List<String> ones = [
      '',
      'one ',
      'two ',
      'three ',
      'four ',
      'five ',
      'six ',
      'seven ',
      'eight ',
      'nine ',
      'ten ',
      'eleven ',
      'twelve ',
      'thirteen ',
      'fourteen ',
      'fifteen ',
      'sixteen ',
      'seventeen ',
      'eighteen ',
      'nineteen '
    ];
    List<String> tens = [
      '',
      '',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
    ];

    str += (numberString[0]) != '0'
        ? ones[int.parse(numberString[0])] + 'hundred '
        : ''; //hundreds
    if ((int.parse('${numberString[1]}${numberString[2]}')) < 20 &&
        (int.parse('${numberString[1]}${numberString[2]}')) > 9) {
      str += ones[int.parse('${numberString[1]}${numberString[2]}')] + 'crore ';
    } else {
      str += (numberString[1]) != '0'
          ? tens[int.parse(numberString[1])] + ' '
          : ''; //tens
      str += (numberString[2]) != '0'
          ? ones[int.parse(numberString[2])] + 'crore '
          : ''; //ones
      str +=
          (numberString[1] != '0') && (numberString[2] == '0') ? 'crore ' : '';
    }
    if ((int.parse('${numberString[3]}${numberString[4]}')) < 20 &&
        (int.parse('${numberString[3]}${numberString[4]}')) > 9) {
      str += ones[int.parse('${numberString[3]}${numberString[4]}')] + 'lakh ';
    } else {
      str += (numberString[3]) != '0'
          ? tens[int.parse(numberString[3])] + ' '
          : ''; //tens
      str += (numberString[4]) != '0'
          ? ones[int.parse(numberString[4])] + 'lakh '
          : ''; //ones
      str +=
          (numberString[3] != '0') && (numberString[4] == '0') ? 'lakh ' : '';
    }
    if ((int.parse('${numberString[5]}${numberString[6]}')) < 20 &&
        (int.parse('${numberString[5]}${numberString[6]}')) > 9) {
      str +=
          ones[int.parse('${numberString[5]}${numberString[6]}')] + 'thousand ';
    } else {
      str += (numberString[5]) != '0'
          ? tens[int.parse(numberString[5])] + ' '
          : ''; //ten thousands
      str += (numberString[6]) != '0'
          ? ones[int.parse(numberString[6])] + 'thousand '
          : ''; //thousands
      str += (numberString[5] != '0') && (numberString[6] == '0')
          ? 'thousand '
          : '';
    }
    str += (numberString[7]) != '0'
        ? ones[int.parse(numberString[7])] + 'hundred '
        : ''; //hundreds
    if ((int.parse('${numberString[8]}${numberString[9]}')) < 20 &&
        (int.parse('${numberString[8]}${numberString[9]}')) > 9) {
      str += ones[int.parse('${numberString[8]}${numberString[9]}')];
    } else {
      str += (numberString[8]) != '0'
          ? tens[int.parse(numberString[8])] + ' '
          : ''; //tens
      str += (numberString[9]) != '0'
          ? ones[int.parse(numberString[9])]
          : ''; //ones
    }
    return str.substring(0, str.length - 1);
  }

  /// Adds ordinal to any number
  String numWithOrdinal(int number) {
    String result = '';
    if (number == 1) {
      result = 'first';
    } else if (number == 2) {
      result = 'second';
    } else if (number == 3) {
      result = 'third';
    } else {
      if (number.toString().length > 1) {
        // number is greater than 9
        if (number == 11) {
          result = 'Eleven';
        } else if (number == 12) {
          result = 'Twelve';
        } else {
          String myOrdinal = 'th';
          String lastDigitToString =
              number.toString().substring(number.toString().length - 1);
          if (lastDigitToString == '1') {
            myOrdinal = 'first';
          } else if (lastDigitToString == '2') {
            myOrdinal = 'second';
          } else if (lastDigitToString == '3') {
            myOrdinal = 'Third';
          } else if (lastDigitToString == '8') {
            myOrdinal = 'h';
          }
          // final _yearLastWord= numToWord(number).split(' ').last;
          // final _yearWithoutLastWord= numToWord(number).replaceAll(_yearLastWord, '');
          result =  numToWord(number)+ myOrdinal;
        }
      } else if (number == 8) {
        result = 'eighth';
      } else {
        result = numToWord(number) + 'th';
      }
    }
    return result;
  }

  /// Convert DateTime(month) to word
  String monthInWord(int month) {
    const List _months = [
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december',
    ];
    return _months[month-1];
  }
}
