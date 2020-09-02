import 'package:QRScanner/constant.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(4),
                color: Colors.purple,
                width: MediaQuery.of(context).size.width * 0.9,
                child: FlatButton(
                    onPressed: null,
                    child: Text(
                      "Generate QR Code",
                      style: tstyle,
                    )),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.purple,
                  child: FlatButton(
                      onPressed: () async {
                        result = await scanner.scan();
                        setState(() {});
                      },
                      child: Text("Scan QR Code", style: tstyle))),
              result == null
                  ? Container()
                  : Container(
                      child: Column(
                        children: [
                          Text(
                            "Output of QR Code",
                            style: tstyle,
                          ),
                          TextField()
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

main() {
  runApp(MaterialApp(
    home: Homescreen(),
  ));
}
