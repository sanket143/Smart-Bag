import 'package:flutter/material.dart';
import  'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic longitude;
  dynamic lattitude;
  JsonCodec json = JsonCodec();

  @override
  void initState(){
    super.initState();

    this.longitude = 0;
    this.lattitude = 0;
  }

  // Fetch Data from ThingSpeak and update
  Future<void> getData() async {

    var dbUrl = "https://api.thingspeak.com/channels/671750/feeds.json?api_key=I6M3D1S7KNYQBVXX&results=2";

    var response = await http.get(
      Uri.encodeFull(dbUrl)
    );

    var content = json.decode(response.body);

    setState((){
      this.longitude = content["channel"]["field1"];
      this.lattitude = content["channel"]["field2"];
    });

    print(content);

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Bag")
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(this.longitude),
              Text(this.lattitude),
              RaisedButton(
                child: Text("Fetch"),
                onPressed: (){
                  getData();
                },
              ),
            ],
          )
        )
      )
    );
  }
}