import 'package:flutter/material.dart';

class TileCluster extends StatefulWidget {
  const TileCluster({ Key? key }) : super(key: key);

  @override
  State<TileCluster> createState() => _TileClusterState();
}

class _TileClusterState extends State<TileCluster> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserTile(),
        EditJobTile(),
        AcceptWorksTile(),
        Row(
          children: [
            CompleteJobTile(),
            AddNewJobTile()
          ],
        )
      ],
    );
  }
}

class UserTile extends StatefulWidget {
  const UserTile({ Key? key }) : super(key: key);

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class EditJobTile extends StatelessWidget {
  const EditJobTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(7.0,8.0)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.border_color_outlined,
            color: Color.fromRGBO(195, 166, 96,1),
            size: 100,
          ),
          Text(
            'View Your Job Listings \nand Edit',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          )
        ],
      ),
    );
  }
}

class AcceptWorksTile extends StatelessWidget {
  const AcceptWorksTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class CompleteJobTile extends StatelessWidget {
  const CompleteJobTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class AddNewJobTile extends StatelessWidget {
  const AddNewJobTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}