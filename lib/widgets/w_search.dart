
// import 'package:flutter/material.dart';

// @override
// class WSearch {
//   static Future<SearchPage<MFruitSalad>> searchPage(
//       BuildContext context) async {
//     CFruitsalad packetProvider =
//         Provider.of<CFruitsalad>(context, listen: false);
//     List<List<MFruitSalad>> list = await packetProvider.getAllsalad.toList();
//     SearchPage<MFruitSalad> searcch = SearchPage<MFruitSalad>(
//         searchStyle: const TextStyle(),
//         items: list.first,
//         searchLabel: MLanguages.searchLabel.tr(),
//         suggestion: Center(
//           child: const Text(MLanguages.suggestion).tr(),
//         ),
//         failure: Center(
//           child: const Text(MLanguages.failure).tr(),
//         ),
//         filter: (MFruitSalad salad) => [
//               salad._arabicName,
//             ],
//         builder: (
//           MFruitSalad salad,
//         ) =>
//             ListTile(
//                 title: WSaladButton(
//               salad: salad,
//               counter: 0,
//             )));
//     return searcch;
//   }
// }
