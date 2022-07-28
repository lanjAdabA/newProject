import 'package:auto_route/annotations.dart';
import 'package:newproject/pages/home.page.dart';
import 'package:newproject/pages/signin.page.dart';
import 'package:newproject/pages/signup.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage, initial: true),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: ContentHomePage),
  ],
)
class $AppRouter {}
