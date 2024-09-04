// part of './../import/import.dart';

// class Wrapper extends StatelessWidget {
//   const Wrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ControllerAuth auth = Provider.of<ControllerAuth>(context, listen: false);
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: auth.userState,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const WidgetProgress();
//           } else if (snapshot.connectionState == ConnectionState.active) {
//             if (snapshot.hasData) {
//               return const VTestNetwok();
//             } else {
//               return const VHome();
//             }
//           } else {
//             return const VHome();
//             // CErrorMassage(
//             // massage: MLanguages.noconnect, callback: () {});
//           }
//         },
//       ),
//     );
//   }
// }
