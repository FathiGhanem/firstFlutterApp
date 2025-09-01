import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  Widget tile(String iconPath, String title, VoidCallback onTap) {
    return ListTile(
      leading: SvgPicture.asset(iconPath, width: 22, height: 22),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: onTap,
      trailing: Icon(Icons.chevron_left),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xFFFF7643),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(radius: 28, child: Icon(Icons.person)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fathi Ghanem",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "fathii.ghanem@gmail.com",
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: Colors.white70),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  tile("assets/icons/Shop Icon.svg", "Store", () {}),
                  tile("assets/icons/Cart Icon.svg", "My Cart", () {}),
                  tile("assets/icons/receipt.svg", "My Orders", () {}),
                  tile("assets/icons/Gift Icon.svg", "Gift Cards", () {}),
                  tile("assets/icons/Star Icon.svg", "Favorate", () {}),
                  Divider(),

                  tile("assets/icons/User Icon.svg", "Profile", () {}),
                  tile("assets/icons/Lock.svg", "Change Password", () {}),
                  tile("assets/icons/Location point.svg", "Addresses", () {}),
                  tile("assets/icons/Mail.svg", "Email", () {}),
                  tile("assets/icons/Phone.svg", "Phone Number", () {}),
                  tile("assets/icons/Settings.svg", "Settings", () {}),
                  Divider(),

                  tile("assets/icons/Bell.svg", "Notifications", () {}),
                  tile("assets/icons/Success.svg", "Completed Orders", () {}),
                  tile("assets/icons/Error.svg", "Cancelled Orders", () {}),
                  tile("assets/icons/Flash Icon.svg", "Flash Deals", () {}),
                  Divider(),

                  tile("assets/icons/Call.svg", "Call Us", () {}),
                  tile("assets/icons/Conversation.svg", "Live Chat", () {}),
                  tile("assets/icons/Question mark.svg", "FAQ", () {}),
                  tile("assets/icons/facebook-2.svg", "Facebook", () {}),
                  tile("assets/icons/twitter.svg", "Twitter", () {}),
                  tile("assets/icons/google-icon.svg", "Google", () {}),
                  Divider(),

                  tile("assets/icons/Log out.svg", "Log Out", () {}),
                  tile("assets/icons/Trash.svg", "Delete Account", () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
