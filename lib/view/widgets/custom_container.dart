import 'package:flutter/material.dart';
import 'package:spotx/core/apptheme.dart';

class CustomContainer extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CustomContainer(
      {super.key, required this.imageUrl, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 8),
          )
        ],
      ),
    );
  }
}
