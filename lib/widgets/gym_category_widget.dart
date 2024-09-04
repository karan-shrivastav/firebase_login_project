import 'package:firebase_login_project/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class GymCategoryWidget extends StatelessWidget {
  final String? name;
  final String? image;
  const GymCategoryWidget({
    super.key,
    this.name,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 23),
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor:const Color(0xfff4f4f4f),
             // backgroundImage: NetworkImage(image ?? '', ),
              child:  ClipOval(
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcATop,
                  ),
                  child: Image.network(
                    image ?? 'https://gymwise.in/uploads/category-icon/Arobic.png',
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
            ),
            TextWidget(
              text: name ?? '',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
