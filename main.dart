import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:barcode_scanner/models/scanresult.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _scanBarcode = 'Unknown';
  List<String> items = <String>[];

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      items.add(barcodeScanRes);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // items.add(barcodeScanRes);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
    // items.add(barcodeScanRes);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Barcode scan'),
              centerTitle: true,
            ),
            body: Builder(builder: (BuildContext context) {
              return Container(
                color: Colors.grey[200],
                alignment: Alignment.center,
                child:
                    // ElevatedButton(
                    //     onPressed: () => scanBarcodeNormal(),
                    //     child: Text('Start barcode scan')),

                    // ElevatedButton(
                    //     onPressed: () {
                    //       startBarcodeScanStream();
                    //
                    //     },
                    //     child: Text('Start barcode scan stream')),
                    // Text('Scan result : $_scanBarcode\n',
                    //     style: TextStyle(fontSize: 20)),

                    // Expanded(
                    //   child: ListView.builder(itemCount: items.length,
                    //       itemBuilder: (BuildContext context, int index){
                    //         return Padding(padding: EdgeInsets.only(right: 4,left: 4),
                    //
                    //           // Table(
                    //           //   border: TableBorder.all(),
                    //           //   columnWidths: const {
                    //           //     0: FlexColumnWidth(1),
                    //           //     1: FlexColumnWidth(10),
                    //           //   },
                    //           //   children: [
                    //           //     TableRow(
                    //           //         children: [
                    //           //         TableCell(child:Text('${index+1}',textAlign: TextAlign.center,),),
                    //           //         Container(height:80,child: Text(items[index]))
                    //           //       ]
                    //           //     )
                    //           //   ],
                    //           // ),
                    //           child: ListTile(
                    //             splashColor: Colors.blue,
                    //         shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         side: BorderSide(color: Colors.lightBlueAccent),),
                    //             dense: true,
                    //             title: Text(items[index]),
                    //           ),
                    //         );
                    //
                    //       }
                    //   ),
                    // ),
                    Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    myCustom(),
                    SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        scanQR();
                      },
                      child: const Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                      ),
                    )
                  ],
                ),

                // Row(
                //   children : [
                // ElevatedButton(
                //   onPressed: () => scanQR(),
                //   child: Text('Start QR scan')),

                // IconButton(onPressed: (){scanQR();}, icon: Icon(Icons.camera_alt_rounded),),

                // ]
                //           ),
              );
            })));
  }

  Widget myCustom() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          child: SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    splashColor: Colors.blue,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   side: BorderSide(color: Colors.lightBlueAccent),
                    // ),
                    dense: true,
                    title: Text(items[index]),
                  );
                }),
          ),
        ),
      );
  }
}
