import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.settings, size: 66, color: Colors.grey[400],),
            SizedBox(height: 10,),
            Text(
              "NTV Prototype Application",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
    );
  }
}

