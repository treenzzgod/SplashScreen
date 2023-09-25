import 'package:flutter/material.dart';

import 'package:splashscreen/models/pemasukan.dart';

class EntryForm extends StatefulWidget {
  final Item? item;
  EntryForm(this.item);
  @override
  EntryFormState createState() => EntryFormState(item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Item? item;
  EntryFormState(this.item);
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (item != null) {
      priceController.text = item!.price.toString();
      descriptionController.text = item!.description;
    }
    //rubah
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: ListView(
        children: <Widget>[
          // nama
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {
                //
              },
            ),
          ),
          // stock
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
              controller: descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {
                //
              },
            ),
          ),
          // tombol button
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: <Widget>[
                // tombol simpan
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark,
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
                          int.parse(priceController.text),
                          descriptionController.text,
                        );
                      } else {
                        // ubah data
                        item?.price = int.parse(priceController.text);
                        item?.description = descriptionController.text;
                      }
                      // kembali ke layar sebelumnya dengan membawa objek item
                      Navigator.pop(context, item);
                    },
                  ),
                ),
                Container(
                  width: 5.0,
                ),
                // tombol batal
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark,
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
    ));
  }
}
