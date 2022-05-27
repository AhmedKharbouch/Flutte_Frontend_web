import 'dart:ui';

import 'package:flutter/material.dart';

import 'main.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('xxxxxx.com'),
              accountEmail: Text('xxxxxxx@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                    "",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  "",
                ),
                fit: BoxFit.cover,
              )
            ),

          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.payments),
            title: Text('Account'),
            onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Page1()))
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text('Customers'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
            onTap: () => null,
            trailing: ClipOval(
            child: Container(
              color: Colors.red,
              width: 20,
              height: 20,
              child: Center(
                child: Text(
                  '8',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
                ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10,right: 10),
            child: Divider(
              color: Colors.green,

            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => null,
          ),

        ],
      ),
    );
  }
}
