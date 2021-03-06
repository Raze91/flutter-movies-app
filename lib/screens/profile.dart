import 'package:flutter/material.dart';
import 'package:flutter_movies_app/components/profile/profile_infos.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileInfos();
  }
}