import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/pemasukan.dart';

class Pemasukanp extends StatefulWidget {
  Pemasukan pemasukan;

  @override
  State<Pemasukanp> createState() => _PemasukanpState();
}

class _PemasukanpState extends State<Pemasukanp> {
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pemasukan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(),
          child: TextField(
            controller: dateController,
            decoration: InputDecoration(
              labelText: "Tanggal",
              icon: Icon(
                Icons.calendar_today_rounded,
              ),
            ),
            onTap: () async {
              DateTime pickeddate = showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickeddate != null) {
                setState(() {
                  dateController.text =
                      DateFormat('yyyy-MM-dd').format(pickeddate);
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
