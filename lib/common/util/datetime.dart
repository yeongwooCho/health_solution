extension DateString on DateTime {
  String convertDateTimeToDateString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  String convertDateTimeToMinute() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')} ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}

extension WeekNumber on DateTime {
  // this 가 올해의 몇 번째 주인지 반환하는 코드
  int getWeekNumber() {
    DateTime firstDayOfYear = DateTime(year, 1, 1);
    int daysOffset = (DateTime.thursday - firstDayOfYear.weekday) % 7;
    DateTime firstThursday = firstDayOfYear.add(Duration(days: daysOffset));
    int weekNumber = 1 + ((difference(firstThursday).inDays) / 7).floor();
    return weekNumber;
  }
}
