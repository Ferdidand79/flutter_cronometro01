import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cronometro01/colors/colores.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  //creandoi la logica de la app

  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;

  List laps = [];

  get itemBuilder => null;

  //crando la funcion stop tiempo

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //creando la funsion de resetear tiempo

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  //creando la funsion start tiempo

  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Cronómetro de Abel 02",
                  style: TextStyle(
                    color: blanco,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  "$digitHours:$digitMinutes:$digitSeconds",
                  style: TextStyle(
                    color: blanco,
                    fontSize: 82.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 400.0,
                decoration: BoxDecoration(
                  color: secundaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                    itemCount: laps.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(

                          padding: const EdgeInsets.all(8.0),                          
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.bottomLeft,
                              colors: <Color>[
                              Color(0xFF121B42),
                              Color(0xFF1C2757),
                              Color(0xFF00B3FA),                            
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Marca N°${index + 1}",
                                style: TextStyle(
                                  color: blanco,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${laps[index]}",
                                style: TextStyle(
                                  color: blanco,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),

              const SizedBox(
                height: 20.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        (!started) ? start() : stop();
                      }, 
                      constraints: const BoxConstraints(minHeight: 50),                     
                      elevation: 0,
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue, width: 3),                        
                      ),
                      child: Text(
                        (!started) ? "start" : "Pause",
                        style: TextStyle(
                          color: blanco,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8.0),

                  IconButton(
                    iconSize: 60.0,
                    color: blanco,
                    onPressed: () {
                      addLaps();
                    },
                    icon: Icon(Icons.timer),
                  ),

                  SizedBox(width: 8.0),

                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        reset();
                      },
                      constraints: const BoxConstraints(minHeight: 50),
                      elevation: 0,
                      fillColor: Colors.blue,
                      shape: StadiumBorder(),
                      child: Text(
                        "Rest",
                        style: TextStyle(
                          color: blanco,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
