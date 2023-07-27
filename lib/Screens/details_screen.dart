import 'package:flutter/material.dart';
import 'package:riverpod_state_management_system/Models/user_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.e}) : super(key: key);
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(e.avatar),

                ),
              ),
              Text(
                e.first_name + " " + e.first_name,
              ),
              Text(
                e.email
              )
            ],
          ),
        ),
      ),
    );
  }
}
