import 'dart:js';

import 'package:bil_co/Authorization.dart';
import 'package:bil_co/components/ErrorDisplayComponents.dart';
import 'package:bil_co/components/ErrorPage404.dart';
import 'package:bil_co/forgot_password_from_mail.dart';
import 'package:bil_co/forgot_password_profile.dart';
import 'package:bil_co/g_building_security.dart';
import 'package:bil_co/product_page.dart';
import 'package:bil_co/profile_page.dart';
import 'package:bil_co/security_login.dart';
import 'package:bil_co/settings_page.dart';
import 'package:bil_co/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'EditPostPageArguments.dart';
import 'constants.dart';
import 'forgot_password.dart';
import 'home_page.dart';
import 'second_hand_sale.dart';
import 'ChatBox.dart';
import 'profile_page.dart';
import 'edit_user_info.dart';
import 'PostPage.dart';
Authorization authorization= Authorization();
void main() {
  //usePathUrlStrategy();
  runApp(const BilCoApp());
}

final _router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) => MaterialPage(
          child: ErrorPage404(),
        ),
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/sign_up",
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: "/admin",
        builder: (context, state) => const SecurityLogin(),
      ),
      GoRoute(
        //TODO DEISECEK ADIL KULLANIM ICIN YAPILDI
        path: "/forgot_password",
        builder: (context, state) => const ForgotPassWord(),
      ),
      GoRoute(
        //TODO DEISECEK ADIL KULLANIM ICIN YAPILDI
        path: "/forgot_password_mail",
        builder: (context, state) => const ForgotPassWordMail(),
      ),
      GoRoute(
        //TODO DEISECEK ADIL KULLANIM ICIN YAPILDI
        path: "/forgot_password_profile",
        builder: (context, state) => const ForgotPassWordProfile(),
      ),
      GoRoute(
          path: "/market/pending_requests",
          builder: (context, state) =>
              const GBuildingSecurity(pageType: 0, search: "")),
      GoRoute(
          path: "/market/accepted_requests",
          builder: (context, state) =>
              const GBuildingSecurity(pageType: 1, search: "")),

      GoRoute(
        path: "/market/second_hand_sale",
        builder: (BuildContext context, GoRouterState state) {
          return FutureBuilder<bool>(
            future: authorization.isAuthenticated(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return a loading indicator if authentication status is being determined
                return CircularProgressIndicator();
              } else {
                if (snapshot.data == true) {
                  // User is authenticated, allow access to HomePage
                  final search = state.queryParams['search'] ?? "";
                  return SecondHandSale(
                    pageType: 0,
                    search: search,
                  );
                } else {
                  context.go("/");
                  return const HomePage();
                }
              }
            },
          );
        },
      ),
      GoRoute(
        path: '/market/borrow',
        builder: (context, state) {
          return FutureBuilder<bool>(
            future: authorization.isAuthenticated(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return a loading indicator if authentication status is being determined
                return CircularProgressIndicator();
              } else {
                if (snapshot.data == true) {
                  // User is authenticated, allow access to HomePage
                  final search = state.queryParams['search'] ?? "";
                  return SecondHandSale(
                    pageType: 1,
                    search: search,
                  );
                } else {
                  // Redirect to login page if not authenticated
                  context.go("/");
                  return const HomePage();
                }
              }
            },
          );
        },
      ),
      GoRoute(
        path: "/market/donation",
        builder: (BuildContext context, GoRouterState state) {
          return FutureBuilder<bool>(
            future: authorization.isAuthenticated(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return a loading indicator if authentication status is being determined
                return CircularProgressIndicator();
              } else {
                if (snapshot.data == true) {
                  // User is authenticated, allow access to HomePage
                  final search = state.queryParams['search'] ?? "";
                  return SecondHandSale(
                    pageType: 2,
                    search: search,
                  );
                } else {
                  // Redirect to login page if not authenticated
                  context.go("/");
                  return const HomePage();
                }
              }
            },
          );
        },
      ),
      GoRoute(
        path: "/market/lost_and_found",
        builder: (BuildContext context, GoRouterState state) {
          return FutureBuilder<bool>(
            future: authorization.isAuthenticated(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return a loading indicator if authentication status is being determined
                return CircularProgressIndicator();
              } else {
                if (snapshot.data == true) {
                  // User is authenticated, allow access to HomePage
                  final search = state.queryParams['search'] ?? "";
                  return SecondHandSale(
                    pageType: 3,
                    search: search,
                  );
                } else {
                  // Redirect to login page if not authenticated
                  context.go("/");
                  return const HomePage();
                }
              }
            },
          );
        },
      ),
      GoRoute(
        path: "/chat_box/:id",
        builder: (BuildContext context, GoRouterState state) {
return FutureBuilder<bool>(
future: authorization.isAuthenticated(),
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
// Return a loading indicator if authentication status is being determined
return CircularProgressIndicator();
} else {
          if(snapshot.data == true){
          final id = state.params['id']!;
          return ChatBox(
            otherUserId: id,
          );
          }else {
            context.go("/");
            return const HomePage();
          }}
        },
      );}),
      GoRoute(
        path: "/profile_page/:id",
          builder: (BuildContext context, GoRouterState state) {
            return FutureBuilder<bool>(
              future: authorization.isAuthenticated(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
// Return a loading indicator if authentication status is being determined
                  return CircularProgressIndicator();
                } else {
                  if(snapshot.data == true){
                    final id = state.params['id']!;
                    return ProfilePage(
                      userId: id,
                    );
                  }else {
                    context.go("/");
                    return const HomePage();
                  }}
              },
            );}),
      GoRoute(
        path: "/edit_user_info/:id",
          builder: (BuildContext context, GoRouterState state) {
            return FutureBuilder<bool>(
              future: authorization.isAuthenticated(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
// Return a loading indicator if authentication status is being determined
                  return CircularProgressIndicator();
                } else {
                  if(snapshot.data == true){
                    final id = state.params['id']!;
                    return EditUserInfo(
                      userId: id,
                    );
                  }else {
                    context.go("/");
                    return const HomePage();
                  }}
              },
            );}),
      GoRoute(
        path: "/post_details/:id",
          builder: (BuildContext context, GoRouterState state) {
            return FutureBuilder<bool>(
              future: authorization.isAuthenticated(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
// Return a loading indicator if authentication status is being determined
                  return CircularProgressIndicator();
                } else {
                  if(snapshot.data == true){
                    final id = state.params['id']!;
                    final isSecurity = state.extra as bool?;
                    return ProductPage(
                      productId: id,
                      isSecurity: isSecurity??false,
                    );
                  }else {
                    context.go("/");
                    return const HomePage();
                  }}
              },
            );}),
      GoRoute(
        path: "/create_post",
          builder: (BuildContext context, GoRouterState state) {
            return FutureBuilder<bool>(
              future: authorization.isAuthenticated(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
// Return a loading indicator if authentication status is being determined
                  return CircularProgressIndicator();
                } else {
                  if(snapshot.data == true){
                    return PostPage(mode: "create");
                  }else {
                    context.go("/");
                    return const HomePage();
                  }}
              },
            );}),
      GoRoute(
          path: "/edit_post/:id",
          builder: (BuildContext context, GoRouterState state) {
return FutureBuilder<bool>(
future: authorization.isAuthenticated(),
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
// Return a loading indicator if authentication status is being determined
return CircularProgressIndicator();
} else {
if(snapshot.data == true){
final id = state.params['id']!;
return PostPage(mode: "edit",postId: id,);
}else {
  context.go("/");
return const HomePage();
}}
},
);}),]);

class BilCoApp extends StatelessWidget {
  const BilCoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      /*initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/sign_up": (context) => const SignUpPage(),
        "/second_hand_sale": (context) => const SecondHandSale(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/edit_post' || settings.name == '/create_post') {
          final args = settings.arguments as EditPostPageArguments;
          return MaterialPageRoute(
            builder: (context) {
              if (settings.name == '/edit_post') {
                return PostPage(mode: args.mode, postId: args.postId);
              } else {
                return PostPage(mode: args.mode, postId: args.postId);
              }
            },
          );
        }
        // Handle other dynamic routes or unknown routes
      },*/

      /*
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyAppRouter().router.routeInformationParser,
      routerDelegate: MyAppRouter().router.routerDelegate,

     */
      /*
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/sign_up": (context) => const SignUpPage(),
        "/second_hand_sale": (context) => const SecondHandSale(),
        "/chat_box": (context) => const ChatBox(),
        "/profile_page": (context) => const ProfilePage(),
        "/edit_user_info": (context) => const EditUserInfo(),
        "/chat_box": (context) => const ChatBox(),
        "/settings": (context) => SettingsPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/edit_post' || settings.name == '/create_post') {
          final args = settings.arguments as EditPostPageArguments;
          return MaterialPageRoute(
            builder: (context) {
              if(settings.name == '/edit_post') {
                return ProcessPost(mode: args.mode, postId: args.postId);
              }
              else{
                return ProcessPost(mode: args.mode);
              }
            },
          );
        }
        // Handle other dynamic routes or unknown routes
      },

       */
    );
  }
}
