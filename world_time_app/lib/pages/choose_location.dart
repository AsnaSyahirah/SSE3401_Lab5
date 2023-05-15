import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Kuala Lumpur',
        flag: 'malaysia_flag.png',
        latitude: '3.140853',
        longitude: '101.693207'),
    WorldTime(
        location: 'Tokyo',
        flag: 'japan_flag.png',
        latitude: '35.652832',
        longitude: '139.839478'),
    WorldTime(
        location: 'Seoul',
        flag: 'southKorea_flag.jpg',
        latitude: '37.532600',
        longitude: '1127.024612'),
    WorldTime(
        location: 'Bern',
        flag: 'switzerland_flag.gif',
        latitude: '46.9166667',
        longitude: '7.4666667'),
    WorldTime(
        location: 'Helsinki',
        flag: 'finland_flag.jpg',
        latitude: '60.192059',
        longitude: '24.945831'),
    WorldTime(
        location: 'London',
        flag: 'unitedkingdom_flag.jpg',
        latitude: '51.509865',
        longitude: '-0.118092'),
    WorldTime(
        location: 'Berlin',
        flag: 'germany_flag.jpeg',
        latitude: '52.520008',
        longitude: '13.404954'),
    WorldTime(
        location: 'Monaco',
        flag: 'monaco_flag.jpg',
        latitude: '43.733334',
        longitude: '7.416667'),
    WorldTime(
        location: 'Abu Dhabi',
        flag: 'uae_flag.jpg',
        latitude: '24.466667',
        longitude: '54.366669'),
    WorldTime(
        location: 'Ottowa',
        flag: 'canada_flag.png',
        latitude: '45.424721',
        longitude: '-75.695000'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
      //body: ElevatedButton(
      //  onPressed: () {
      //    setState(() {
      //      counter += 1;
      //    });
      //  },
      //  child: Text('counter is $counter'),
    );
    //);
  }
}
