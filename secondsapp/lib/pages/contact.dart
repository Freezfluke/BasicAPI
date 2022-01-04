import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  // const ContactPage({ Key? key }) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 10),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/icon-call-center.png',
                    height: 200, fit: BoxFit.fill),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ติดต่อเรา",
                  style: TextStyle(
                      fontFamily: 'korbau',
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Container(
            child: Column(
              children: [
                Text(
                  "แอพพลิเคชันพัฒนาโดย Fluke Yannapol",
                  style: TextStyle(
                    fontFamily: 'korbau',
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Tel 099-123-8203",
                  style: TextStyle(
                    fontFamily: 'korbau',
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Email Freezflukezazu@gmail.com",
                  style: TextStyle(
                    fontFamily: 'korbau',
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
