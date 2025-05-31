// import 'package:go_router/go_router.dart';
// import 'package:flutter/material.dart';

// final GoRouter router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder:
//           (context, state) =>
//               const Scaffold(body: Center(child: Text('Home Page'))),
//     ),
//     GoRoute(
//       path: '/prayers',
//       builder:
//           (context, state) =>
//               const Scaffold(body: Center(child: Text('Prayers Page'))),
//     ),
//     GoRoute(
//       path: '/settings',
//       builder:
//           (context, state) =>
//               const Scaffold(body: Center(child: Text('Settings Page'))),
//     ),
//   ],
//   errorBuilder:
//       (context, state) =>
//           Scaffold(body: Center(child: Text('Error: ${state.error}'))),
// );

// class Routes {
//   GoRouter router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         pageBuilder: (context, state) => CustomTransitionPage(
//           key: state.pageKey,
//           child: const PrayerScreen(),
//           transitionsBuilder: _fadeTransition,
//         ),
//       ),
//       GoRoute(
//         path: KeyManager.tasbeehCounterScreenKey,
//         pageBuilder: (context, state) {
//           final extra = state.extra as int;
//           return CustomTransitionPage(
//             key: state.pageKey,
//             child: TasbeehCounterScreen(
//               counterValue: extra,
//             ),
//             transitionsBuilder: _fadeTransition,
//           );
//         },
//       ),
//     ],
//   );
// //smooth transition :
//   static Widget _fadeTransition(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     const curve = Curves.easeInOut;
//     var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

//     return FadeTransition(
//       opacity: animation.drive(fadeTween),
//       child: child,
//     );
//   }
// }
