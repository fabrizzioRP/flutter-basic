import 'package:flutter/material.dart';

import 'package:componentes_app/src/providers/theme_states.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static final settingsPage = 'setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Consumer<ThemeState>(
          builder: (context, state, child) {
            return Card(
              margin: EdgeInsets.all(5),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Use Dark Mode : ',
                    style: TextStyle(fontSize: 15),
                  )),
                  Switch(
                    activeColor: Colors.red,
                    value: state.isDarkEnabled,
                    inactiveThumbColor: Colors.orange,
                    inactiveTrackColor: Colors.orange[100],
                    onChanged: (_) {
                      state.setDarkModel(!state.isDarkEnabled);
                    },
                  ),
                  SizedBox(width: 20),
                ],
              ),
            );
          },
        ),
        Expanded(
          child: Container(),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
