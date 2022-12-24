import 'package:flutter/material.dart';
import 'package:grocery_app/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => print('My name was pressed.'),
                    child: const Text(
                      'Hi,  My name',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text('nahidhasannoyon20@gmail.com'),
                  const Divider(
                    height: 40,
                    thickness: 2,
                  ),
                  _listTiles(
                    icon: Icons.manage_accounts_outlined,
                    title: "Address",
                    subtitle: "My Address",
                    onPress: () {},
                  ),
                  _listTiles(
                    icon: Icons.shopping_bag_outlined,
                    title: "Order",
                    onPress: () {},
                  ),
                  _listTiles(
                    icon: Icons.favorite_border_outlined,
                    title: "WishList",
                    onPress: () {},
                  ),
                  _listTiles(
                    icon: Icons.remove_red_eye_outlined,
                    title: "Viewed",
                    onPress: () {},
                  ),
                  _listTiles(
                    icon: Icons.password_outlined,
                    title: "Forgot Password",
                    onPress: () {},
                  ),
                  SwitchListTile(
                    title: const Text(
                      'Theme',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    secondary: Icon(themeState.getDarkTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined),
                    onChanged: (bool value) {
                      setState(() {
                        themeState.setDarkTheme = value;
                      });
                    },
                    value: themeState.getDarkTheme,
                  ),
                  _listTiles(
                    icon: Icons.exit_to_app_outlined,
                    title: "Logout",
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTiles({
    required IconData icon,
    required String title,
    String? subtitle,
    required Function onPress,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(subtitle ?? ""),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: (() {
        onPress();
      }),
    );
  }
}
