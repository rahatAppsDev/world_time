import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List locations = [WorldTime(location: 'London',flag: 'london.jpg',url: 'Europe/London'),
      WorldTime(location: 'Berlin',flag: 'berlin.png',url: 'Europe/Berlin'),
  WorldTime(location: 'Cairo',flag: 'cairo.png',url: 'Africa/Cairo'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }




  int counter = 0;


  @override
  Widget build(BuildContext context) {
    print('build state run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(itemBuilder: (context,index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
          child: Card(
            child: ListTile(
              onTap: () {
                updateTime(index);

              }, title: Text(locations[index].location),
              leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),),
            ),
          ),
        );
      },itemCount: locations.length,)
    );
  }
}




























