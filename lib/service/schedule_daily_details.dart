class ScheduleDailyDetails {
  int hour;
  int minute;
  ScheduleDailyDetails(this.hour, this.minute);
  ScheduleDailyDetails.fromJson(Map<String, dynamic> json)
      : hour = json['hour'],
        minute = json['minute'];

  Map<String, dynamic> toJson() => {'hour': hour, 'minute': minute};
}
