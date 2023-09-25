import 'package:flutter/material.dart';
import 'package:splashscreen/db/dbloginhelper.dart';
import 'package:splashscreen/pages/cashflow.dart';
import 'package:splashscreen/pages/home.dart';
import '../models/pemasukan.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class Pemasukanp extends StatefulWidget {
  final Item? item;
  Pemasukanp(this.item);
  //  Pemasukanp(this.pemasukan);

  @override
  State<Pemasukanp> createState() => PemasukanpState(item);
}

class PemasukanpState extends State<Pemasukanp> {
  Item? item;
  PemasukanpState(this.item);
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pemasukan'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                // Container(
                //   padding: const EdgeInsets.all(12),
                //   margin: const EdgeInsets.only(),
                //   child: TextField(
                //     controller: dateController,
                //     decoration: InputDecoration(
                //       labelText: "Tanggal",
                //       icon: Icon(
                //         Icons.calendar_today_rounded,
                //       ),
                //     ),
                //     onTap: () async {
                //       DateTime? pickeddate = await showDatePicker(
                //         context: context,
                //         initialDate: DateTime.now(),
                //         firstDate: DateTime(2000),
                //         lastDate: DateTime(2101),
                //       );
                //       if (pickeddate != null) {
                //         setState(() {
                //           dateController.text =
                //               DateFormat('yyyy-MM-dd').format(pickeddate);
                //         });
                //       }
                //     },
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Nominal',
                    ),
                    onChanged: (value) {
                      
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      // tombol simpan
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).primaryColorDark,
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColorLight)),
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            if (item == null) {
                              // tambah data
                              item = Item(
                                // DateTime.parse(dateController.text),
                                int.parse(amountController.text),
                                descriptionController.text,
                                // nameController.text,
                                // int.parse(priceController.text),
                                // int.parse(stockController.text),
                                // kodeBarangController.text,
                              );
                            } else {
                              // ubah data
                              // item?.date = DateTime.parse(dateController.text);
                              item?.price = int.parse(amountController.text);
                              item?.description = descriptionController.text;
                              //   pemasukan?.name = nameController.text;
                              //  pemasukan?.price = int.parse(priceController.text);
                              //   pemasukan?.stock = int.parse(stockController.text);
                              //   pemasukan?.kodeBarang = kodeBarangController.text;
                            }
                            // kembali ke layar sebelumnya dengan membawa objek item
                            Navigator.pop(context, item);
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).primaryColorDark,
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColorLight)),
                          child: Text(
                            'Cancel',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
