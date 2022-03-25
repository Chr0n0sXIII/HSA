import 'package:flutter/material.dart';
import 'package:home_service_app/views/homeView.dart';
import 'package:home_service_app/views/userProfileView.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: const Color.fromRGBO(4, 31, 81, 1),
      child: Row(children: [
        SizedBox(
          height: 80,
          width: 150,
          child: Image.asset('assets/app_logo.png'),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children:  [
              InkWell(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeView()));
                },
                hoverColor: Colors.transparent,
                child: Text('Home',
                    style: TextStyle(
                      color: Color.fromRGBO(195, 166, 96, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    )),
              ),
              SizedBox(
                width: 60,
              ),
              Text('Job Listings',
                  style: TextStyle(
                    color: Color.fromRGBO(195, 166, 96, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/profile_picture_place_holder.png'),
                ),
              ),
              const Dropdown()
            ],
          ),
        )
      ]),
    );
  }
}

class _DropdownState extends State<Dropdown> {
  final items = ['Settings', 'Logout'];
  String username = "Username";
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      elevation: 12,
      iconSize: 32,
      underline: const SizedBox(),
      iconEnabledColor: const Color.fromRGBO(195, 166, 96, 1),
      hint: Text(username,
          style: const TextStyle(color: Color.fromRGBO(195, 166, 96, 1))),
      items: [
        DropdownMenuItem(
          child: Text(items[0]),
          value: items[0],
        ),
        DropdownMenuItem(
          child: Text(
            items[1],
            style: const TextStyle(color: Colors.red),
          ),
          value: items[1],
        )
      ],
      onChanged: (value) {
        if (value == 'Settings') {
          Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserProfileView()));
        }
      }
    );
  }
}

class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(4, 31, 81, 1)),
            child: Image.asset("assets/app_logo.png"),
          ),
          DrawerItem(
            name: "Home",
            onClick: () {},
          ),
          DrawerItem(
            name: "Job Listings",
            onClick: () {},
          ),
          DrawerItem(
            name: "Settings",
            onClick: () {},
          ),
          DrawerItem(
            name: "Logout",
            onClick: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.name, required this.onClick})
      : super(key: key);

  final String name;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      horizontalTitleGap: 0.0,
      title: Text(
        name,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
