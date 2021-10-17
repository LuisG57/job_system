import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Screens/lading_screen.dart';
import 'package:jos_search_app/View/Screens/post_form_screen/post_form_screen.dart';
import 'package:jos_search_app/View/Screens/sign_screens/sign_up_screen_searcher.dart';
import 'package:jos_search_app/View/Screens/sign_screens/sign_up_screen_poster.dart';
import 'package:jos_search_app/View/Widgets/navigation_bar/navigation_bar.dart'
    as nb;
import 'package:jos_search_app/providers/puesto.dart';
import 'package:jos_search_app/providers/usuario.dart';
import 'package:jos_search_app/providers/usuario_provedor.dart';
import 'View/Screens/feed_screen.dart';
import 'View/Screens/job_detail_screen.dart';
import 'View/Screens/job_details_screen.dart';
import 'View/Screens/sign_in_screen.dart';
import './View/Screens/sign_up_screen.dart';
import 'View/Screens/about_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UsuarioProvedor()),
        ChangeNotifierProvider(create: (ctx) => Puesto())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
        ),
        initialRoute: '/',
        routes: {
          // '/': (ctx) => nb.NavigationBar(),
          '/': (ctx) => nb.NavigationBar(),
          // '/': (ctx) => LandingScreen(), I commented this to test job detail go back to this when done ma g
          SignInScreen.routeName: (ctx) => SignInScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          AboutScreen.routeName: (ctx) => AboutScreen(),
          SignUpScreenPoster.routeName: (ctx) => SignUpScreenPoster(),
          SignUpScreenSearcher.routeName: (ctx) => SignUpScreenSearcher(),
          PostFormScreen.routeName: (ctx) => PostFormScreen(),
          FeedScreen.routeName: (ctx) => FeedScreen(),
          JobDetailScreen.routeName: (ctx) => JobDetailScreen(),
          nb.NavigationBar.routeName: (ctx) => nb.NavigationBar(),

          //LandingScreen.routeName: (ctx) => LandingScreen(),
        },
      ),
    );
  }
}

/*
I get the same error, for a couple of weeks now, when trying to run an app from the master channel.

I got it working by forcing the web renderer to be HTML:

flutter run -d chrome --no-sound-null-safety --web-renderer=html   //use this code in the console   1 


When you build your app for web you should:


flutter build web --no-sound-null-safety --web-renderer=html  //use this code in the console      2


By default the web renderer is auto, choosing the canvaskit web renderer on desktop browsers and html on mobile.

If you want to avoid this altogether you can stay on the beta or dev channels.
 */
