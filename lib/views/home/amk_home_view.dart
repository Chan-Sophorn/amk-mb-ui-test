import 'package:amk_mobile/constants/app_color.dart';
import 'package:amk_mobile/constants/app_images.dart';
import 'package:amk_mobile/constants/utils.dart';
import 'package:amk_mobile/views/widgets/menu_item_view.dart';
import 'package:flutter/material.dart';

class AmkHomeView extends StatelessWidget {
  AmkHomeView({super.key});
  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.logo,
                    color: AppColor.mainColor,
                    height: 40.0,
                  ),
                  SizedBox(
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NotificationWidget(number: "6"),
                        InkWell(
                          onTap: () => print("Amk Location"),
                          child: Icon(Icons.location_city_outlined, size: 34),
                        ),
                        InkWell(
                          onTap: () => print("QR code"),
                          child: Icon(Icons.qr_code_2_outlined, size: 34),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(AppImages.cat),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${Utils.getGreeting()}, Kitty!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MenuItemView(),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buttonFastWidget(
                    title: "Fast Payment",
                    icon: Icons.payment,
                    onTap: () => print("Fast Payment click test"),
                  ),
                  buttonFastWidget(
                    title: "Fast Transfer",
                    icon: Icons.send,
                    color: Colors.blue,
                    onTap: () => print("Fast Transfer click test"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buttonFastWidget({
    String? title,
    Color? color,
    IconData? icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () => print("$title click"),
      child: Container(
        width: (width / 2) - 30,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColor.mainColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            Text(
              title ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  final number;
  const NotificationWidget({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/notification'),
      child: Stack(
        children: [
          Icon(Icons.notifications, size: 34, color: Colors.grey),
          Positioned(
            right: 4,
            top: -2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                number,
                style: TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
