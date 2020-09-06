import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';

class Qrscan extends StatefulWidget {
  const Qrscan({
    Key key,
  }) : super(key: key);
  @override
  _QrscanState createState() => _QrscanState();
}

class _QrscanState extends State<Qrscan> {
  Uint8List result;
  TextEditingController codecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  width: size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter string",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.purple)),
                    ),
                    controller: codecontroller,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(4)),
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  child: FlatButton(
                      onPressed: () async {
                        result = await generateBarCode(codecontroller.text);
                        setState(() {});
                        print(result.toString());
                      },
                      child: Text(
                        "Generate QR code",
                        style: TextStyle(backgroundColor: Colors.purple),
                      )),
                ),
                Container(
                    margin: EdgeInsets.all(5),
                    child: result == null
                        ? Container(
                            height: size.height * 0.5,
                            width: size.width * 0.8,
                            child: Center(
                                child: Text(
                              "Waiting for QR code....",
                              style: TextStyle(color: Colors.purple),
                            )),
                          )
                        : Container(
                            height: size.height * 0.5,
                            width: size.width * 0.8,
                            child: Image.memory(result),
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
