part of sl_utils;

int daysInMonth({required final int year, required final int month}) {
    final int februaryLasDay = isLeapYear(year) ? 29 : 28;

    final List<int> monthLength = [
      //January - February - March - April - May - June
      31, februaryLasDay, 31, 30, 31, 30,
      //July - August - September - October - Novemeber - Decemeber
      31, 31, 30, 31, 30, 31
    ];
    return monthLength[month - 1];
  }

bool isLeapYear(int year) {
    bool leapYear = false;

    final bool leap = (year % 100 == 0) && (year % 400 != 0);
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) {
      leapYear = true;
    }

    return leapYear;
  }

extension DateTimeExt on DateTime {
  DateTime copyWith(
      {int? year, int? month, int? day, int? hour, int? minute, int? second, int? millisecond, int? microsecond,}) {
    return DateTime(year ?? this.year, month ?? this.month, day ?? this.day, hour ?? this.hour, minute ?? this.minute,
        second ?? this.second, millisecond ?? this.millisecond, microsecond ?? this.microsecond,);
  }

  DateTime copyWithAndAdd(
      {int year = 0,
      int month = 0,
      int day = 0,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0,}) {
    return DateTime(this.year + year, this.month + month, this.day + day, this.hour + hour, this.minute + minute,
        this.second + second, this.millisecond + millisecond, this.microsecond + microsecond,);
  }

  DateTime getPreviousMonth() {
    return copyWith(month: month - 1);
  }

  DateTime getNextMonth() {
    return copyWith(month: month + 1);
  }

  bool isWithinRange(DateTimeRange range) {
    if ((isBefore(range.end) || isAtSameMomentAs(range.end)) &&
        (isAfter(range.start) || isAtSameMomentAs(range.start))) {
      return true;
    } else {
      return false;
    }
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  int daysInCurrentMonth() {
    return daysInMonth(year: year, month: month);
  }

  DateTime getDayBefore() {
    return getDay().copyWithAndAdd(day: -1);
  }

  ///Return 
  DateTime getDay() {
    return copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
  }

  DateTime getDayAfter() {
    return getDay().copyWithAndAdd(day: 1);
  }

  int getDaysUntil(DateTime nextDate) {
        return (nextDate.getDay().difference(this).inHours / 24).round();
  }
}

extension DateTimeRangeExt on DateTimeRange {
  bool overlapsWith(DateTimeRange secondRange) {
    if ((start.isBefore(secondRange.end) || start.isAtSameMomentAs(secondRange.end)) &&
        (end.isAfter(secondRange.start) || end.isAtSameMomentAs(secondRange.start))) {
      return true;
    } else {
      return false;
    }
  }

  DateTimeRange? getOverlap(DateTimeRange secondRange) {
    if (!overlapsWith(secondRange)) return null;

    DateTime start;
    DateTime end;

    if (this.start.isBefore(secondRange.start)) {
      start = secondRange.start.copyWith();
    } else {
      start = this.start.copyWith();
    }

    if (this.end.isAfter(secondRange.end)) {
      end = secondRange.end.copyWith();
    } else {
      end = this.end.copyWith();
    }

    return DateTimeRange(start: start, end: end);
  }
}
