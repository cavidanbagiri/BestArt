import 'package:bestart/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

PreferredSizeWidget? AppBarWidget() {
  Get.lazyPut(() => AuthController());
  FirebaseAuth auth = FirebaseAuth.instance;
  return PreferredSize(
    preferredSize: Size.fromHeight(40.0),
    child: AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: const Text(
        'BestArt',
        style: TextStyle(
            color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            onTap: () {
              Get.toNamed('/friends');
            },
            child: IconButton(
              onPressed: () {
                Get.toNamed('/friends');
              },
              icon: const Icon(
                Icons.people,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            onTap: () {
              Get.toNamed('/populararticles');
            },
            child: IconButton(
              onPressed: () {
                Get.toNamed('/populararticles');
              },
              icon: const Icon(
                Icons.article,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            onTap: () {
              Get.toNamed('/notifications');
            },
            child: IconButton(
              onPressed: () {
                Get.toNamed('/notifications');
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            onTap: () {
              Get.toNamed('/addarticle');
            },
            child: IconButton(
              onPressed: () {
                Get.toNamed('/addarticle');
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            onTap: () {

            },
            child: TextButton.icon(
              onPressed: () {
              },
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: Text(
                '${auth.currentUser?.email.toString()}',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ),

        auth.currentUser?.email == null
            ? Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: TextButton.icon(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    icon: const Icon(
                      Icons.login,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
              ) //If Not Login Show Login
            : Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  onTap: () {
                    //Get.put(AuthController());
                    Get.find<AuthController>().logoutFunc();
                  },
                  child: TextButton.icon(
                    onPressed: () {
                      Get.find<AuthController>().logoutFunc();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
              ),
        //Logout
      ],
    ),
  );
}
