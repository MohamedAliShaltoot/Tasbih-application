import 'package:flutter/material.dart';

void showAlertDialog(context) => showDialog(context: context, builder: (context){
  return AlertDialog(
  actionsPadding: const EdgeInsets.symmetric(horizontal: 19,vertical: 10),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
  backgroundColor: Colors.white,
  elevation: 14,
  //icon: const Icon(Icons.error,color: Colors.orange,size: 40,),
          title: const Text('Information',
            style: TextStyle(color: Colors.orange,
              fontWeight: FontWeight.bold)),
          content: const Text(
            'My name is Mohamed Ali "The Developer" ',
          ),
          actions: [
            
            // ElevatedButton(
            
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all<Color>(
            //       Colors.orange)
            //   ),
            //   onPressed: () {  
            //   Navigator.pop(context);
            // },
            // child: const Text('Confirm',
            // style: TextStyle(color: Colors.black,
            //   fontWeight: FontWeight.bold)),
            //   ),
ElevatedButton(
  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.orange)
              ),
  onPressed: () {  
              Navigator.pop(context);
            },
            child: const Text('Exit',
            style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold)),),
          ],
          );
});