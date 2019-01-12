import 'package:flutter/material.dart';

import 'package:smartbag/homepage.dart';

void main(){
  runApp( 
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Bag",
      theme: new ThemeData(
        primarySwatch: Colors.amber
      ),
      home: HomePage(),
    )
  );
}
