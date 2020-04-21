import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, @required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://api.github.com/users";
  List data;
  bool isLoading = false;

  Future<String> _getJsonData() async {
    var res = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertDataToJson = json.decode(res.body);
      this.data = convertDataToJson;
      print(this.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int i) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    // child: Image.network(data[i]["avatar_url"],),
                    backgroundImage: NetworkImage(data[i]["avatar_url"]),
                  ),
                  title: Text(
                    data[i]['login'],
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "${data[i]["url"]}\n${data[i]["html_url"]}",
                    style: TextStyle(fontSize: 13),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: this.data.length,
      ),
    );
  }
}
