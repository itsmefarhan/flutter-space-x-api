class Launch {
  final String missionName;
  final String launchYear;
  final String rocketName;
  final String rocketType;
  final String imageUrl;
  final bool launchSuccess;
  final String details;

  Launch(
      {this.missionName,
      this.launchYear,
      this.rocketName,
      this.rocketType,
      this.imageUrl,
      this.launchSuccess,
      this.details});

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
        missionName: json['mission_name'],
        launchYear: json['launch_year'],
        rocketName: json['rocket']['rocket_name'],
        rocketType: json['rocket']['rocket_type'],
        imageUrl: json['links']['mission_patch'],
        launchSuccess: json['launch_success'],
        details: json['details']);
  }
}
