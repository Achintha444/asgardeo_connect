import 'package:flutter/material.dart';

class ProfileParameter extends StatelessWidget {
   final String? parameter;
   final String? value;
   final IconData? icon;

  const ProfileParameter({Key? key, this.parameter, this.value, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: double.infinity,
        child: Icon(Icons.phone),
      ),
      dense: true,
      title: Text(
        "Phone Number",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black38),
      ),
      subtitle: Text(
        "071-838-1361",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      style: ListTileStyle.list,
    );
  }
}
