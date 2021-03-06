import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MortageApp extends StatefulWidget {
  @override
  _MortageAppState createState() => _MortageAppState();
}

class _MortageAppState extends State<MortageApp> {
  double _interest = 0.0;
  int _lengthOfLone = 0;
  double _homePrice = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Mortage Payment",
            // style: TextStyle(
            //     color: Colors.deepPurple.shade800,
            //     fontSize: 19.0,
            //     fontWeight: FontWeight.bold,
            //     fontStyle: FontStyle.italic),
          ),
        ),
        //  backgroundColor: Colors.pink.shade900,
      ),
      body: Container(
        // color: Colors.black,
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(15.0, 100.0, 15.0, 0.0),
              height: 130,
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Monthly Payment",
                      // style: TextStyle(
                      //     color: Colors.deepPurple.shade800,
                      //     fontSize: 18.0,
                      //     fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                        " ${(_homePrice > 0 && _interest > 0.0) ? "\₹${calculateMonthlyPayment(_homePrice, _interest, _lengthOfLone)}" : ""}")
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              decoration: BoxDecoration(
                  //  color: Colors.deepPurple.shade800,
                  border: Border.all(
                      //      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    // style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                        prefixText: "Home Price",
                        prefixIcon: Icon(Icons.home_sharp)),
                    onChanged: (String value) {
                      try {
                        _homePrice = double.parse(value);
                      } catch (exception) {
                        _homePrice = 0.0;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Length of Lone (year)"),
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_lengthOfLone > 0) {
                                    _lengthOfLone -= 5;
                                  } else {
                                    //do nothing
                                  }
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  //   color: Colors.deepPurple.shade200,
                                ),
                                child: Center(
                                  child: Text("-"),
                                ),
                              ),
                            ),
                            Text(" $_lengthOfLone"),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _lengthOfLone += 5;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  //     color: Colors.deepPurple.shade200,
                                ),
                                child: Center(
                                  child: Text("+"),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Interest"),
                        Text(" ${_interest.toStringAsFixed(2)} %")
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Slider(
                          min: 0.0,
                          max: 10.0,
                          activeColor: Colors.pinkAccent,
                          inactiveColor: Colors.grey,
                          value: _interest,
                          onChanged: (double newValue) {
                            setState(() {
                              _interest = newValue;
                            });
                          }),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

calculateMonthlyPayment(double homePrice, double interest, lengthOfLoan) {
  int n = 12 * lengthOfLoan;
  double c = interest / 12.0 / 100.0;
  double monthlyPayment = 0.0;
  if (homePrice < 0 || homePrice.toString().isEmpty || homePrice == null) {
  } else {
    monthlyPayment = homePrice * c * pow(1 + c, n) / (pow(1 + c, n) - 1);
  }
  return monthlyPayment.toStringAsFixed(2);
}
