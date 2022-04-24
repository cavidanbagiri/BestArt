import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 50,
            child: const DrawerHeader(
                child: Text(
                  'Main Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          //Home Tile
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
                maxWidth: 24,
                maxHeight: 24,
              ),
              child: Image.asset('assets/img/home.png', fit: BoxFit.cover,),
            ),
            title: const Text('Home'),
            onTap: () {
              print('Home Page Clicked');
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(top: 15, bottom: 5),
            child: const Text(
              'Articles',
            ),
          ),
          //My Articles
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
                maxWidth: 24,
                maxHeight: 24,
              ),
              child: Image.asset('assets/img/myarticles.png', fit: BoxFit.cover,),
            ),
            title: const Text('My Articles'),
            onTap: () {
              print('My Clicked');
            },
          ),
          //Popular Articles Tile
          ListTile(
            leading:ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
                maxWidth: 24,
                maxHeight: 24,
              ),
              child: Image.asset('assets/img/populararticles.png', fit: BoxFit.cover,),
            ),
            title: const Text('Popular Articles'),
            onTap: () {
              print('Popular Articles Clicked');
            },
          ),
          //All Articles
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
                maxWidth: 24,
                maxHeight: 24,
              ),
              child: Image.asset('assets/img/allarticles.png', fit: BoxFit.cover,),
            ),
            title: const Text('All Articles'),
            onTap: () {
              print('All Articles Clicked');
            },
          ),
          //Add Articles
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
                maxWidth: 24,
                maxHeight: 24,
              ),
              child: Image.asset('assets/img/addarticles.png', fit: BoxFit.cover,),
            ),
            title: const Text('Add Article'),
            onTap: () {
              print('Add Articles Clicked');
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            margin: const EdgeInsets.only(top: 15, bottom: 5),
            child: const Text(
              'Community',
            ),
          ),
          //Create Community
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
                maxWidth: 24,
                maxHeight: 24,
              ),
              child: Image.asset('assets/img/createcommunity.png', fit: BoxFit.cover,),
            ),
            title: Text('Create Community'),
            onTap: () {
              print('Create Community Clicked');
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(top: 15, bottom: 5),
            child: const Text(
              'Other',
            ),
          ),
          //Notifications
          ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 14,
                minHeight: 14,
                maxWidth: 24,
                maxHeight: 24,
              ),
              child: Image.asset('assets/img/notifications.png', fit: BoxFit.cover,),
            ),
            title: Text('Notifications'),
            onTap: () {
              print('Notifications Clicked');
            },
          ),
          //Settings
          ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 14,
                minHeight: 14,
                maxWidth: 24,
                maxHeight: 24,
              ),
              child: Image.asset('assets/img/settings.png', fit: BoxFit.cover,),
            ),
            title: Text('User Settings'),
            onTap: () {
              print('Add Articles Clicked');
            },
          ),
        ],
      ),
    );
  }
}
