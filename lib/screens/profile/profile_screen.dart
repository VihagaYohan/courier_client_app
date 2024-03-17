import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

// model
import 'package:courier_client_app/models/models.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  // fetch profile data
  Future<void> getCurrentUser() async {
    try {
      final response = await Helper.getCurrentUser();
    } catch (e) {
      print('Error occured at');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
