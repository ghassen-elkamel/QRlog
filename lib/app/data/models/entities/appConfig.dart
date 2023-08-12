class AppConfig {
  AppConfig({
    this.begintime,
    this.endtime,
    required this.breakbegin,
    required this.breakend,
    this.tolerance,
    required this.remote,

  });

  String? begintime;
  String? endtime;
  String? breakbegin;
  int? breakend;
  int? tolerance;
  bool remote;

  factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
    begintime: json["begintime"],
    endtime: json["endtime"],
    breakbegin: json["breakbegin"],
    breakend: json["breakend"],
    tolerance: json["tolerance"],
    remote: json["remote"],
  );

  Map<String, dynamic> toJson() => {
    "begintime": begintime,
    "endtime": endtime,
    "breakbegin": breakbegin,
    "breakend": breakend,
    "tolerance": tolerance,
    "remote": remote,
  };
}