
class DateTimeAdapter {
  DateTime _dateTime;

  DateTimeAdapter(this._dateTime);

  @override
  String toString() {
    return "${_dateTime.year}-${_dateTime.month.toString().padLeft(2, '0')}-${_dateTime.day.toString().padLeft(2, '0')} ${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}";
  }
}
