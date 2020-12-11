import 'package:bmi_calculator/presentation/result/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currVal = 80;
  int _option = 1;

  int weight = 0;
  int age = 0;
  List<RadioGender> dataGender = [
    RadioGender(
        isSelected: true, symbol: "assets/icons/female.svg", text: "FEMALE"),
    RadioGender(
        isSelected: false, symbol: "assets/icons/male.svg", text: "MALE"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B113C),
      appBar: AppBar(
        backgroundColor: Color(0xff12163A),
        title: Text("BMI "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  // ini untuk ngatur
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _option = 0;
                              setState(() {
                                dataGender.forEach((element) {
                                  element.isSelected = false;
                                });
                                dataGender[_option]..isSelected = true;
                              });
                            },
                            child: GenderContainer(
                              data: dataGender[0],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                _option = 1;
                                setState(() {
                                  dataGender.forEach((element) {
                                    element.isSelected = false;
                                  });
                                  dataGender[_option]..isSelected = true;
                                });
                              },
                              child: GenderContainer(
                                data: dataGender[1],
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                            color: Color(0xff272A4D),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "HEIGHT",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(_currVal.round().toString() + "cm",
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Slider(
                              value: _currVal,
                              onChanged: (val) {
                                setState(() {
                                  _currVal = val;
                                });
                              },
                              min: 80,
                              max: 300,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff272A4D),
                                  borderRadius: BorderRadius.circular(5)),
                              child: CalculateValueContainer(
                                label: "WEIGHT",
                                minVal: 60,
                                onPressed: (val) {
                                  weight = val;
                                },
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff272A4D),
                                  borderRadius: BorderRadius.circular(5)),
                              child: CalculateValueContainer(
                                label: "AGE",
                                minVal: 25,
                                onPressed: (val) {
                                  age = val;
                                },
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Color(0xffFF0067),
                onPressed: () {
                  final int _gender = _option;
                  final double _height = _currVal;
                  final int _weight = weight;
                  final int _age = age;

                  final _result = (_weight ) / ((_height/100) * (_height/100));

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                result: _result,
                              )));
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

class CalculateValueContainer extends StatefulWidget {
  const CalculateValueContainer(
      {Key key, this.label, this.minVal, this.onPressed})
      : super(key: key);
  final String label;
  final int minVal;
  final ValueChanged<int> onPressed;
  @override
  _CalculateValueContainerState createState() =>
      _CalculateValueContainerState();
}

class _CalculateValueContainerState extends State<CalculateValueContainer> {
  int _currVal;
  @override
  void initState() {
    _currVal = widget.minVal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(_currVal.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              height: 40,
              minWidth: 40,
              color: Color(0xff373F74),
              shape: CircleBorder(),
              child: Text(
                "-",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  if (_currVal >= 0) _currVal--;
                });
                widget.onPressed(_currVal);
              },
            ),
            MaterialButton(
              height: 40,
              minWidth: 40,
              color: Color(0xff373F74),
              shape: CircleBorder(),
              child: Text(
                "+",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  if (_currVal >= 0) _currVal++;
                });

                widget.onPressed(_currVal);
              },
            )
          ],
        )
      ],
    );
  }
}

class GenderContainer extends StatelessWidget {
  const GenderContainer({Key key, @required this.data}) : super(key: key);

  final RadioGender data;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        decoration: BoxDecoration(
            color: Color(0xff272A4D), borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              data.symbol,
              color: (!data.isSelected) ? Colors.grey : Colors.white,
            ),
            Text(
              data.text,
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }
}

class RadioGender {
  bool isSelected;
  final String symbol;
  final String text;
  RadioGender({this.isSelected, this.symbol, this.text});
}
