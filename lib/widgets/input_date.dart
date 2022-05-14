import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:exospace_app/services/services.dart';


class InputDate extends StatefulWidget {

  const InputDate({
    Key? key,
  }) : super(key: key);

  @override
  State<InputDate> createState() => InputDateState();
}

class InputDateState extends State<InputDate> {

  TextEditingController dateinput = TextEditingController();
  String dateValue = '';

  @override
  void initState() {
    dateinput.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final roverService = Provider.of<RoverService>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 25, left: 10, right: 10),
      padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
      decoration: _styleContainer(),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only( right: 15 ),
              child: TextField(
                keyboardType: TextInputType.datetime,
                controller: dateinput,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context, initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2300)
                  );
                  
                  if(pickedDate != null ){ 
                    setState(() {
                      dateinput.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                      dateValue = DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                },
              ),
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.indigo,
            child: const Icon(Icons.search, color: Colors.white,),
            onPressed: roverService.isLoading 
              ? null 
              : () async {
                  await roverService.getPhotosByDate(dateValue);
                }
          )
        ],
      ),
    );
  }

  BoxDecoration _styleContainer() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20)
  );
}