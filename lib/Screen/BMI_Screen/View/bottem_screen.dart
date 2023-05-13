import 'package:flutter/material.dart';

Widget bottomsheet(BuildContext context, result) {
  return Transform.scale(
    scale: 2.5,
    child: Container(
      color: Colors.black,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "YOUR BMI RESULT  ",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: Text(
                  "NORMAL WEIGHT",
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  // width: 200,
                  // height: 200,
                  decoration: BoxDecoration(color: Colors.pink),
                  child: Text(
                    "${result.toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.pinkAccent),
                alignment: Alignment.center,
                child: const Text(
                  "RE - CALCULATE",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}