import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/screens/chat.dart';
import 'package:food_ninja/screens/dashboard.dart';
import 'package:food_ninja/screens/forgot_password.dart';
import 'package:food_ninja/screens/onboarding.dart';
import 'package:food_ninja/screens/popular_menu.dart';
import 'package:food_ninja/screens/popular_restaurant.dart';
import 'package:food_ninja/screens/product_details.dart';
import 'package:food_ninja/screens/profile.dart';
import 'package:food_ninja/screens/set_location.dart';
import 'package:food_ninja/screens/sign_in.dart';
import 'package:food_ninja/screens/sign_up.dart';
import 'package:food_ninja/screens/sign_up_complete.dart';
import 'package:food_ninja/screens/sign_up_otp.dart';
import 'package:food_ninja/screens/sign_up_upload_photo.dart';
import 'package:food_ninja/screens/sign_up_user_details.dart';
import 'package:food_ninja/utils/prefs.dart';
import 'package:food_ninja/widgets/scaffold_with_nested_nav.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    const options = FirebaseOptions(
      apiKey: "AIzaSyDFZJpI4G0QAHQ4GkHhrWNrUB7I6OTCiP4",
      appId: "1:616254766388:web:add68db5054bc5d6f47961",
      messagingSenderId: "616254766388",
      projectId: "food-ninja-b1914",
    );
    await Firebase.initializeApp(
      options: options,
    );
  }
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');

final initialLocation = Prefs().getStringPrefs(PrefKeys.userId);

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: initialLocation == null ? '/' : '/dashboard',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Onboarding();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'signin',
          builder: (BuildContext context, GoRouterState state) {
            return const SignIn();
          },
        ),
        GoRoute(
          path: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUp();
          },
        ),
        GoRoute(
          path: 'signupUserDetails',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpUserDetails();
          },
        ),
        GoRoute(
          path: 'signupOtp',
          builder: (BuildContext context, GoRouterState state) {
            return const SignupOtp();
          },
        ),
        GoRoute(
          path: 'signupUploadPhoto',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpUploadPhoto();
          },
        ),
        GoRoute(
          path: 'signupComplete',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpComplete();
          },
        ),
        GoRoute(
          path: 'setLocation',
          builder: (BuildContext context, GoRouterState state) {
            return const SetLocation();
          },
        ),
        GoRoute(
          path: 'forgotPassword',
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPassword();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/product-details',
      builder: (context, state) {
        return const ProductDetails();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        // Return the widget that implements the custom shell (in this case
        // using a BottomNavigationBar). The StatefulNavigationShell is passed
        // to be able access the state of the shell and to navigate to other
        // branches in a stateful way.
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            GoRoute(
              name: 'dashboard',
              path: '/dashboard',
              builder: (BuildContext context, GoRouterState state) {
                return const Dashboard();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'dashboard',
                  builder: (BuildContext context, GoRouterState state) {
                    return const Dashboard();
                  },
                ),
                GoRoute(
                  path: 'popular-restaurants',
                  builder: (BuildContext context, GoRouterState state) {
                    return const PopularRestaurant();
                  },
                ),
                GoRoute(
                  path: 'popular-menu',
                  builder: (BuildContext context, GoRouterState state) {
                    return const PopularMenu();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Profile(),
              ),
              routes: [
                GoRoute(
                    path: 'path', builder: (context, state) => const Profile()),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/cart',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SignIn(),
              ),
              routes: [
                GoRoute(
                    path: 'path', builder: (context, state) => const SignIn()),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/chat',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Chat(),
              ),
              routes: [
                GoRoute(
                    path: 'path', builder: (context, state) => const Chat()),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
  // routes: <RouteBase>[
  //   GoRoute(
  //     path: '/',
  //     builder: (BuildContext context, GoRouterState state) {
  //       return const Onboarding();
  //     },
  //     routes: <RouteBase>[
  //       GoRoute(
  //         path: 'signin',
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const SignIn();
  //         },
  //       ),
  //       GoRoute(
  //         path: 'signup',
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const SignUp();
  //         },
  //       ),
  //       GoRoute(
  //         path: 'signupUserDetails',
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const SignUpUserDetails();
  //         },
  //       ),
  //       GoRoute(
  //         path: 'signupOtp',
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const SignupOtp();
  //         },
  //       ),
  //       GoRoute(
  //         path: 'signupUploadPhoto',
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const SignUpUploadPhoto();
  //         },
  //       ),
  //       GoRoute(
  //         path: 'signupComplete',
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const SignUpComplete();
  //         },
  //       ),
  //       GoRoute(
  //         path: 'setLocation',
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const SetLocation();
  //         },
  //       ),
  //       GoRoute(
  //         path: 'forgotPassword',
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const ForgotPassword();
  //         },
  //       ),
  //     ],
  //   ),
  //   GoRoute(
  //     name: 'dashboard',
  //     path: '/dashboard',
  //     builder: (BuildContext context, GoRouterState state) {
  //       return const Dashboard();
  //     },
  //     routes: <RouteBase>[
  //       GoRoute(
  //         path: 'dashboard',
  //         builder: (BuildContext context, GoRouterState state) {
  //           return const Dashboard();
  //         },
  //       ),
  //     ],
  //   ),
  // ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
