// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vrouter/vrouter.dart';
// import '../providers/changepasword_provider.dart';
//
//
// class ChangePassword extends StatelessWidget {
//   const ChangePassword({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ChangePasswordProvider(context),
//       child: const _ChangePassword(),
//     );
//   }
// }
//
// class _ChangePassword extends StatelessWidget {
//   const _ChangePassword({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<ChangePasswordProvider>();
//     final staticProvider = context.read<ChangePasswordProvider>();
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => context.vRouter.pop(),
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         elevation: 0,
//         title: const Text(
//           'Phone Number',
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ListView(
//                 children: [
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   Text(
//                     'Old Password',
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   TextField(
//                     obscureText: true,
//                     style: Theme.of(context).textTheme.labelLarge,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       disabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       hintStyle: Theme.of(context).textTheme.labelLarge,
//                       hintText: '.................',
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 24,
//                   ),
//
//                   Text(
//                     'New Password',
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   TextField(
//                     obscureText: true,
//                     style: Theme.of(context).textTheme.labelLarge,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       disabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       hintStyle: Theme.of(context).textTheme.labelLarge,
//                       hintText: '.................',
//                     ),
//                   ),
//
//                   const SizedBox(
//                     height: 24,
//                   ),
//
//                   Text(
//                     'New Password Again',
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   TextField(
//                     obscureText: true,
//                     style: Theme.of(context).textTheme.labelLarge,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       disabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
//                       ),
//                       hintStyle: Theme.of(context).textTheme.labelLarge,
//                       hintText: '.................',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.blue),
//                 foregroundColor: MaterialStateProperty.all(Colors.white),
//                 shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               onPressed: () {},
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Text(
//                       'Save',
//                       style:
//                       Theme.of(context).textTheme.titleSmall!.copyWith(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
