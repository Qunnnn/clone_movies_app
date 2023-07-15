class ScheduleDailyDetails {
  int hour;
  int minute;
  bool status;
  ScheduleDailyDetails(this.hour, this.minute, this.status) ;
  ScheduleDailyDetails.fromJson(Map<String, dynamic> json)
      : hour = json['hour'],
        minute = json['minute'],
        status = json['status']
        ;

  Map<String, dynamic> toJson() => {'hour': hour, 'minute': minute , 'status' : status};
}
