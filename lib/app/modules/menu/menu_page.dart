import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key key, this.title = "Menu"}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[400],
        child: ListView(
          children: <Widget>[
            _avatar(),
            Divider(color: Colors.black),
            _tiles("Ranking", Icons.format_list_numbered, 0, () {}),
          ],
        ),
      ),
    );
  }

  Widget _avatar() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              'DTS',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            height: 12.0,
          ),
          Text(
            "DevTeam Solutions",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            "devteamsolutions1@gmail.com",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _tiles(String text, IconData icon, int item, Function onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      onTap: onTap,
      // selected: item == itemSelect,
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
