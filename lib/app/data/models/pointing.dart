class Pointing {
  Pointing({
    required this.action,
    required this.scannedQr,
  });

  String action;
  String scannedQr;

  Map<String, dynamic> toJson() => {
        "action": action,
        "scannedQr": scannedQr,
      };
}
