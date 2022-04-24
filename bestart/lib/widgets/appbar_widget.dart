import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';


PreferredSizeWidget? AppBarWidget(){
  return PreferredSize(
    preferredSize: Size.fromHeight(40.0),
    child: AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: const Text('BestArt', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left:8, right: 8),
          child: InkWell(
            onTap: (){ Get.toNamed('/friends');},
            child: IconButton(
              onPressed: () {
                Get.toNamed('/friends');
              },
              icon: const Icon(Icons.people, color: Colors.black,),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8, right: 8),
          child: InkWell(
            onTap: (){ Get.toNamed('/populararticles');},
            child: IconButton(
              onPressed: () {
                Get.toNamed('/populararticles');
              },
              icon: const Icon(Icons.article, color: Colors.black,),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8, right: 8),
          child: InkWell(
            onTap: (){ Get.toNamed('/notifications');},
            child: IconButton(
              onPressed: () {
                Get.toNamed('/notifications');
              },
              icon: const Icon(Icons.notifications, color: Colors.black,),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8, right: 8),
          child: InkWell(
            onTap: (){ Get.toNamed('/addarticle');},
            child: IconButton(
              onPressed: () {
                Get.toNamed('/addarticle');
              },
              icon: const Icon(Icons.add, color: Colors.black,),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8, right: 8),
          child: InkWell(
            onTap: (){ Get.toNamed('/profile');},
            child: IconButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              icon: const Icon(Icons.person, color: Colors.black,),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8, right: 8),
          child: InkWell(
            onTap: (){ Get.toNamed('/login');},
            child: TextButton.icon(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              icon: const Icon(Icons.login, color: Colors.black,),
              label: const Text('Login', style: TextStyle(color: Colors.black, fontSize: 12),),
            ),
          ),
        ),//If Not Login Show Login

        //Logout
      ],
    ),
  );
}