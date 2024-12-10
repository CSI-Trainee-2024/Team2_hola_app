import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/Settings/subSettings/time%20management/timeTrack.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Apptime extends StatefulWidget {
  Apptime({super.key});

  @override
  State<Apptime> createState() => _ApptimeState();
}

class _ApptimeState extends State<Apptime> with WidgetsBindingObserver {
  late DateTime startTime;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      // App opened or brought to foreground
      startTime = DateTime.now();
    } else if (state == AppLifecycleState.paused) {
      // App minimized or closed
      final sessionDuration = DateTime.now().difference(startTime).inSeconds;
      await TimeStorage.sessionTime(sessionDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Management'),
      ),
      body: Center(
        child: FutureBuilder(
          future: TimeStorage.getTodayUse(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            final totalUsageSeconds = snapshot.data!;
            final hours = totalUsageSeconds ~/ 3600;
            final minutes = (totalUsageSeconds % 3600) ~/ 60;
            final seconds = totalUsageSeconds % 60;
            return Text(
              'Today\'s Usage: ${hours}h ${minutes}m ${seconds}s',
              style: textTheme.apptextTheme.bodyLarge,);
          },
        ),
      ),
    );
  }
}
