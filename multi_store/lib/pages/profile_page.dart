import 'package:flutter/material.dart';
import 'package:multi_store/pages/cart_page.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profile-page';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Stack(
          children: [
            Container(
              height: 180,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.teal,
                    Colors.green,
                  ],
                ),
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  backgroundColor: Colors.white,
                  expandedHeight: 140,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      return FlexibleSpaceBar(
                        centerTitle: true,
                        title: AnimatedOpacity(
                          duration: const Duration(
                            microseconds: 200,
                          ),
                          opacity: constraints.biggest.height <= 120 ? 1 : 0,
                          child: const Text(
                            'Account',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        background: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.teal,
                                Colors.green,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                      'assets/images/inapp/guest.jpg'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Guest',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // * Cart
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  ),
                                ),
                                child: TextButton(
                                  child: SizedBox(
                                    height: 70,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Center(
                                      child: Text(
                                        'Cart',
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        CartPage.routeName);
                                  },
                                ),
                              ),
                              // * Orders
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.teal,
                                      Colors.green,
                                    ],
                                  ),
                                ),
                                child: TextButton(
                                  child: SizedBox(
                                    height: 70,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Center(
                                      child: Text(
                                        'Order',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              // * Wishlist
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: TextButton(
                                  child: SizedBox(
                                    height: 70,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Center(
                                      child: Text(
                                        'Wishlist',
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.grey.shade300,
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/inapp/logo.jpg'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const DividerWithLabel(label: 'Account Info.'),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 260,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: const [
                                    RepeatedListTile(
                                      icon: Icons.email_outlined,
                                      title: 'Email Address',
                                      subTitle: 'nahidhasannoyon20@gmail.com',
                                    ),
                                    CustomDivider(),
                                    RepeatedListTile(
                                      icon: Icons.phone_outlined,
                                      title: 'Phone Number',
                                      subTitle: '01627465928',
                                    ),
                                    CustomDivider(),
                                    RepeatedListTile(
                                      icon: Icons.location_pin,
                                      title: 'Address',
                                      subTitle: 'Dhaka-1212, Bangladesh',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const DividerWithLabel(label: 'Profile Settings'),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 260,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    RepeatedListTile(
                                      onPress: () {},
                                      icon: Icons.edit,
                                      title: 'Edit Profile',
                                    ),
                                    const CustomDivider(),
                                    RepeatedListTile(
                                      onPress: () {},
                                      icon: Icons.lock,
                                      title: 'Change Password',
                                    ),
                                    const CustomDivider(),
                                    RepeatedListTile(
                                      onPress: () {},
                                      icon: Icons.exit_to_app_outlined,
                                      title: 'Logout',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final Function()? onPress;
  final IconData icon;
  final String title;
  final String subTitle;
  const RepeatedListTile({
    Key? key,
    this.onPress,
    required this.icon,
    required this.title,
    this.subTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        thickness: 2,
        color: Colors.teal,
      ),
    );
  }
}

class DividerWithLabel extends StatelessWidget {
  final String label;
  const DividerWithLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
          width: 50,
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ),
        Text(
          '  $label  ',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 40,
          width: 50,
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
