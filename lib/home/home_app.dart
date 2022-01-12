import 'package:flutter/material.dart';
import 'package:flutter_cronometro01/colors/colores.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({ Key? key }) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor, 
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Cronómetro app",
                  style: TextStyle(
                    color: blanco,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height:400.0,
                decoration: BoxDecoration(
                  color: secundaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {                       
                      },
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.blue),
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