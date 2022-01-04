import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:secondsapp/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Eat Fruit And Fluke",
          style: TextStyle(
              fontFamily: 'Korbau',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              // var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return myBox(
                      snapshot.data[index]['title'],
                      snapshot.data[index]['subtitle'].substring(0, 40),
                      snapshot.data[index]['image_url'],
                      snapshot.data[index]['detail']);
                },
                itemCount: snapshot.data.length,
              );
            },
            future: getData(),
            // future:
            // DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget myBox(String title, String subtitle, String imageUrl, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = imageUrl;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 30, left: 5, right: 5),
      padding: EdgeInsets.all(20),
      // color: Colors.yellow[200],
      height: 236,

      decoration: BoxDecoration(
          // color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.30), BlendMode.darken)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                offset: Offset(3, 3),
                blurRadius: 10,
                spreadRadius: 0)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              print("Next Page >>>");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(v1, v2, v3, v4)));
            },
            child: Text(
              "อ่านต่อ",
              style: TextStyle(fontSize: 18),
            ),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey),
          )
        ],
      ),
    );
  }

  Future getData() async {
    //https://raw.githubusercontent.com/Freezfluke/BasicAPI/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/Freezfluke/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
