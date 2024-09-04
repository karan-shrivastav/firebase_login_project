import 'package:firebase_login_project/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class GymComonentWidget extends StatelessWidget {
  final String? image;
  final String? name;
  const GymComonentWidget({super.key, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.65,
      child: Column(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: const Color(0xfff4f4f4f),
            backgroundImage: NetworkImage(image ?? ''),
          ),
          Container(
            height: 55,
            margin: const EdgeInsets.only(right: 5),
            alignment: Alignment.center,
            color: const Color(0xfff4f4f4f),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                  width: 50,
                  child: Image.network(image ?? ''),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextWidget(
                    text: name ?? '',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
