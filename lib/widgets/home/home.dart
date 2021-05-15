import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';
import '../../services/size_service.dart';
import '../base/hoverable_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    initSizeService(context);

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoverableButton(
              text: 'START',
              iconData: FontAwesomeIcons.dumbbell,
              defaultColor: Colors.white,
              hoverColor: AppColors.red,
              size: scaleWidth(50),
              onPressed: () async {
                await Navigator.pushNamed(context, '/workout');
              },
            )
          ],
        ),
      ),
    );
  }
}
