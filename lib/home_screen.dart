import 'package:badamsoff/calc_logic.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String expr = "";
  String initial = "0";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Output Text
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 35.0, bottom: 70.0),
              alignment: Alignment.centerRight,
              width: double.infinity,
              child: Text(
                expr.isNotEmpty ? expr : initial,
                style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),

          // Row 1 Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn('C', Colors.white, const Color.fromRGBO(247, 184, 68, 1)),
                _buildBtn("\u03C0", const Color.fromRGBO(202, 163, 86, 1),
                    const Color.fromRGBO(246, 240, 226, 1)),
                _buildBtn("\u0065", const Color.fromRGBO(202, 163, 86, 1),
                    const Color.fromRGBO(246, 240, 226, 1)),
                _buildBtn('\u00d7', const Color.fromRGBO(102, 50, 156, 1),
                    const Color.fromRGBO(225, 213, 233, 1)),
              ],
            ),
          ),

          // Row 2 Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                    '7', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn(
                    '8', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn(
                    '9', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn('\u002f', const Color.fromRGBO(102, 50, 156, 1),
                    const Color.fromRGBO(225, 213, 233, 1)),
              ],
            ),
          ),

          // Row 3 Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                    '4', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn(
                    '5', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn(
                    '6', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn('\u2212', const Color.fromRGBO(102, 50, 156, 1),
                    const Color.fromRGBO(225, 213, 233, 1)),
              ],
            ),
          ),

          // Row 4 Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                    '1', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn(
                    '2', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn(
                    '3', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn('\u002b', const Color.fromRGBO(102, 50, 156, 1),
                    const Color.fromRGBO(225, 213, 233, 1)),
              ],
            ),
          ),

          // Row 5 Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                    '\u2022', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn(
                    '0', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn(
                    '\u232b', Colors.black45, const Color.fromRGBO(240, 241, 243, 1)),
                _buildBtn(
                    '\u003d', Colors.white, Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // A function for creating buttons
  _buildBtn(btnTxt, txtColor, bgColor) {
    return Container(
      height: 73,
      width: 80,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 2.0,
            spreadRadius: 1.5,
            offset: Offset(
              -2.0,
              -2.0,
            ),
          ),
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            // spreadRadius: 1.5,
            offset: Offset(
              2.0,
              2.0,
            ),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            expr = calcLogic(btnTxt, context);
          });
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38.0),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(txtColor),
          backgroundColor: MaterialStateProperty.all(
              // Color.fromRGBO(240, 241, 243, 1),
              bgColor),
          // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
        ),
        child: Text(
          "$btnTxt",
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
