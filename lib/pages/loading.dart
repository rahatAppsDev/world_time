import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time = 'Loading...';

  void setupworldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await instance.getTime();
    //await print(instance.time);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

  }
  @override
  void initState() {

    super.initState();
    print('init state run');
    setupworldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 80.0,
        ),

      )
    );
  }
}
