import 'package:flutter/material.dart';
import 'package:secondsapp/pages/cals.dart';
import 'package:secondsapp/pages/contact.dart';
import 'package:secondsapp/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.amber),
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  // const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    CalculatePage(),
    ContactPage()
  ]; //เก็บค่าของ TAB เป็น Array เริ่มจากตำแหน่งที่ 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //หน้าปัจจุบันที่เลือก
        items: [
          // หน้าแต่ละหน้ามีไอคอนอะไรบ้าง
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "หน้าแรก"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "คำนวณ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page), label: "ติดต่อเรา"),
        ],
        onTap: (index) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
