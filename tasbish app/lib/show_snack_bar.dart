// import 'package:flutter/material.dart';

// class ShowSnackBar extends StatelessWidget {
//   const ShowSnackBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  SnackBar(
//       content: const Text("view App Setings."),
//       duration: const Duration(seconds: 5),
//       action: SnackBarAction(
//         textColor: Colors.black,
//         label: "Undo",
//         onPressed: () {
//           ScaffoldMessenger.of(context).hideCurrentSnackBar();
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

SnackBar ShowSnackBar(BuildContext context) {
    return SnackBar(
        backgroundColor: Colors.orange,
        content: const Text(
         "View App Settings.",
          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 18, 17, 17)),
        ),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          textColor: Colors.black,
          label: "Undo",
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
  }
