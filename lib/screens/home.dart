import 'package:flutter/material.dart';
import 'package:spacex/model/launch.dart';

import 'package:spacex/screens/mission_detail.dart';
import 'package:spacex/services/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Launch> launches = List();
  List<Launch> filteredLaunches = List();

  initState() {
    super.initState();
    Service.getLaunches().then((launchesFromServer) {
      setState(() {
        launches = launchesFromServer;
        filteredLaunches = launches;
      });
    });
  }

  TextEditingController searchController = TextEditingController();

  Widget appBarTitle = Text('Space X');

  Icon actionIcon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBarTitle,
          actions: <Widget>[
            IconButton(
                icon: actionIcon,
                onPressed: () {
                  setState(() {
                    if (actionIcon.icon == Icons.search) {
                      actionIcon = Icon(Icons.close);
                      appBarTitle = TextField(
                        controller: searchController,
                        onChanged: (val) {
                          setState(() {
                            filteredLaunches = launches
                                .where((launch) => launch.missionName
                                    .toLowerCase()
                                    .contains(val.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration:
                            InputDecoration(hintText: 'Search mission by name'),
                      );
                    } else {
                      setState(() {
                        actionIcon = Icon(Icons.search);
                        appBarTitle = Text('Space X');
                        searchController.clear();
                      });
                    }
                  });
                })
          ],
        ),
        body: GridView.builder(
            itemCount: filteredLaunches.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  child: GridTile(
                    child: Image.network(
                      filteredLaunches[i].imageUrl,
                      fit: BoxFit.cover,
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black87,
                      title: Text(
                        filteredLaunches[i].missionName,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MissionDetail(
                        missionName: filteredLaunches[i].missionName,
                        details: filteredLaunches[i].details,
                        imageUrl: filteredLaunches[i].imageUrl,
                        launchSuccess: filteredLaunches[i].launchSuccess,
                        launchYear: filteredLaunches[i].launchYear,
                        rocketName: filteredLaunches[i].rocketName,
                        rocketType: filteredLaunches[i].rocketType,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
