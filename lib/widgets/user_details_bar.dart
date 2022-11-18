import 'package:flutter/material.dart';
import 'package:indicart/model/user_details_model.dart';
import 'package:indicart/providers/user_details_provider.dart';
import 'package:indicart/utils/color_themes.dart';
import 'package:indicart/utils/constants.dart';
import 'package:indicart/utils/utils.dart';
import 'package:provider/provider.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;
  const UserDetailsBar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    UserDetailsModel userDetails =
        Provider.of<UserDetailsProvider>(context).userDetails;
    return Positioned(
      top: -offset / 3,
      child: Container(
        height: kAppBarHeight / 2,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: lightBackgroundaGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.7,
                child: Text(
                  "Deliver to ${userDetails.name} - ${userDetails.address} ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
