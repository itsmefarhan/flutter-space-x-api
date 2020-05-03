import 'package:flutter/material.dart';

class MissionDetail extends StatelessWidget {
  final String missionName;
  final String launchYear;
  final String rocketName;
  final String rocketType;
  final String imageUrl;
  final bool launchSuccess;
  final String details;

  MissionDetail(
      {this.missionName,
      this.launchYear,
      this.rocketName,
      this.rocketType,
      this.imageUrl,
      this.launchSuccess,
      this.details});

  final textStyle = TextStyle(fontSize: 20.0, color: Colors.teal);

  prefix(String label, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          style: textStyle,
        ),
        Text(
          value,
          style: TextStyle(letterSpacing: 1.1),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(missionName)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                child: Image.network(imageUrl),
              ),
              Divider(),
              SizedBox(
                height: 10.0,
              ),
              prefix('Mission Name', missionName),
              SizedBox(height: 10.0),
              prefix('Rocket Name', rocketName),
              SizedBox(height: 10.0),
              prefix('Rocket Type', rocketType),
              SizedBox(height: 10.0),
              prefix('Launch Year', launchYear),
              SizedBox(height: 10.0),
              prefix('Launch Status', launchSuccess ? 'Success' : 'Failed'),
              SizedBox(height: 20.0),
              Text(
                'Status Details',
                style: textStyle,
              ),
              SizedBox(height: 10.0),
              Text(
                details != null ? details : 'Details are not available',                
                style: TextStyle(fontSize: 15, height: 1.5, letterSpacing: 1.1),
              ),
              //TODO: url launcher
            ],
          ),
        ),
      ),
    );
  }
}
