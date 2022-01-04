import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  // const CalculatePage({Key? key}) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  //ตำแหน่งสำหรับเก็บข้อมูลที่ User กรอกเข้ามา
  TextEditingController quantity =
      TextEditingController(); //ช่องสำหรับเก็บข้อมูลที่ User กรอกเข้ามา
  TextEditingController price =
      TextEditingController(); //ช่องสำหรับเก็บข้อมูลที่ User กรอกเข้ามา
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    super.initState();
    //ฟังก์ชั่นพิเศษสำหรับตั้งค่าในครั้งแรก
    result.text =
        "ซื้อกล้วยจำนวน x เครือ ราคาหน่วยละ x บาท รวมลูกค้าต้องจ่ายทั้งหมด xx บาท";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 30, 50, 10),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/banana.png'),
                Text(
                  "โปรแกรมคำนวณราคาผลไม้",
                  style: TextStyle(
                      fontFamily: 'korbau',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: price,
                  decoration: InputDecoration(
                      labelText: 'ราคาต่อหน่วย', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: quantity,
                  decoration: InputDecoration(
                      labelText: "จำนวนที่ซื้อ", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: Text(
                      "คำนวนราคาสุทธิ",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      var cal = double.parse(quantity.text) *
                          double.parse(
                              price.text); //วิธีการแปลงจากข้อความเป็น number
                      print("Totalprice: ${cal} Bath");

                      setState(() {
                        result.text =
                            "ซื้อกล้วยจำนวน ${quantity.text} เครือ ราคาเครือละ ${price.text} บาท รวมลูกค้าต้องจ่ายทั้งหมด ${cal} บาท";
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellowAccent),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(50, 10, 50, 10)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'korbau')),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  result.text,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
