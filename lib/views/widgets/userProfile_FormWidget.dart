import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({ Key? key }) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    String currentUser = "";
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(196, 196, 196, 1),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              height: 250,
              width: 250,
              child: Image.asset('assets/profile_picture_place_holder.png')
            ),
            Container(
              width: 250,
              height: 75,
              decoration: BoxDecoration(
                color: Color.fromRGBO(54, 153, 244, 1),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  Text(
                    'Update Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  ),
                  Text(
                    'Picture',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              'Username',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: currentUser
              ),
            )
          ],
        ),
         Row(
          children: [
            Text(
              'About Me',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: currentUser
              ),
            )
          ],
        ),
         Row(
          children: [
            Text(
              'Profession / Trade Skills',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: currentUser
              ),
            )
          ],
        ),
         Row(
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: currentUser
              ),
            )
          ],
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: Color.fromRGBO(11, 206, 131, 1),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        )
      ],
    );
  }
}