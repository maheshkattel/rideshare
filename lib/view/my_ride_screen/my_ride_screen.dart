import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/colors/color.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';

class MyRideScreen extends StatelessWidget {
  const MyRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('myride')
                  .snapshots(),
              builder: (context, snapshot) {
                var data = snapshot.data?.docs;
                return Expanded(
                  child: snapshot.hasData
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: data?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 20,
                                color: AppColors.primaryColor50,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Car/Taxi:' +
                                                  data![index]['car']),
                                              Text('A/C' + data[index]['ac']),
                                              Text(
                                                  'Fuel: ${data[index]['fuel']}'),
                                              Text(
                                                  'Date${data[index]['time']}'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Image.asset(
                                              'assets/images/mustanggt.png'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(child: CircularProgressIndicator()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
