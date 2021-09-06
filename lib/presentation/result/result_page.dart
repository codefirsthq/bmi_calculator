import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key, this.result}) : super(key: key);

  final double? result;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? dataResult;
  @override
  void initState() {
    dataResult = widget.result.toString().substring(0,4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B113C),
      appBar: AppBar(
        backgroundColor: Color(0xff12163A),
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Result : ",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff272A4D),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "NORMAL",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text("$dataResult",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 70)),
                      Text("Normal BMI range : ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Text("18.5 - 25 kg/m2",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      SizedBox(height: 30),
                      Text("You have a normal body weight, Good job",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: double.infinity,
                          height: 50,
                          child: FlatButton(
                            splashColor: Colors.grey,
                            color: Colors.black,
                            child: Text(
                              "SAVE RESULT",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
          Container(
              width: double.infinity,
              height: 60,
              child: FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Color(0xffFF0067),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "CALCULATE BMI",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
