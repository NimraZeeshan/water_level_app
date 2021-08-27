import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:water_level_app/provider/google_sign_in.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // final imageUrl =
  //     'https://media-exp1.licdn.com/dms/image/C4E03AQGuKFqvQ7EDNg/profile-displayphoto-shrink_200_200/0/1624706123959?e=1631145600&v=beta&t=GxbrJMWR0GJ3nixw20HxyAr8rmc8bbjeLEr8qjZ3kts';

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: NetworkImage(user.photoURL)),
              accountName: Text(
                'Name:' + user.displayName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              ),
              accountEmail: Text(
                'Email :' + user.email,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14),
              ),
            ),
          ),
          // ElevatedButton(
          //   // onPressed: () {
          // //   //   final provider =
          // //   //       Provider.of<GoogleSignInProvider>(context, listen: false);
          // //   //   provider.logout();
          // //   },
          //   child: Text('Logout'),
          // ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.blue),
            title: Text(
              'Home',
              textScaleFactor: 1.2,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.blue),
            title: Text(
              'Profile',
              textScaleFactor: 1.2,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings, color: Colors.blue),
            title: Text(
              'Setting',
              textScaleFactor: 1.2,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
