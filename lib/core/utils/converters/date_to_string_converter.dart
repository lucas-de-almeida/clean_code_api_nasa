class DateToStringConverter {
  static String convert(DateTime date) {
    print(date);
    var dateSplitted = date.toString().split(' ');
    return dateSplitted.first;
  }
}
