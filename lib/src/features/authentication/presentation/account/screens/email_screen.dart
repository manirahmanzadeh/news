// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vrouter/vrouter.dart';
// import '../providers/email_provider.dart';
//
//
// class EmailPage extends StatelessWidget {
//   const EmailPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final email = context.vRouter.historyState['email'] ?? 'email';
//     return ChangeNotifierProvider(
//       create: (context) => EmailProvider(context, email),
//       child: const _EmailPage(),
//     );
//   }
// }
//
// class _EmailPage extends StatelessWidget {
//   const _EmailPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<EmailProvider>();
//     final staticProvider = context.read<EmailProvider>();
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => context.vRouter.pop(),
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         elevation: 0,
//         title: const Text(
//           'Email',
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   'Change Email',
//                   style: Theme.of(context).textTheme.titleSmall,
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 TextField(
//                   style: Theme.of(context).textTheme.labelLarge,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                       borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                     ),
//                     disabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                       borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                       borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                       borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                     ),
//                     hintStyle: Theme.of(context).textTheme.labelLarge,
//                     hintText: staticProvider.email,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Text(
//                   'We Will Send verification to your New Email',
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: const Color(0xFF40BFFF)
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.blue),
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Text(
//                           'Save',
//                           style:
//                           Theme.of(context).textTheme.titleSmall!.copyWith(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
