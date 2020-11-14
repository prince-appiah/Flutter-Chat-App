import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_chat_app/services/database.dart';
import '../widgets/appbar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Database _database = new Database();
  TextEditingController _searchController = new TextEditingController();
  QuerySnapshot _querySnapshot;

  searchUser() {
    return _database.fetchUser(_searchController.text).then((val) {
      // TODO: implement user search with network
      setState(() {
        _querySnapshot = val;
      });

      print('Found user: $val');
    }).catchError((e) {
      print('Error while getting user: $e');
    });
  }

  // createRoom(String username){
  //   List<String> users=[username,myName];
  //   _database.createRoom(roomId, roomData)
  // }

  // _querySnapshot !== null?
  Widget renderSearchResults() {
    return ListView.builder(
        itemCount: _querySnapshot.docs.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SearchResult(
            userName:
                (_querySnapshot.docs[index].data as Map)["username"].toString(),
            userEmail:
                (_querySnapshot.docs[index].data as Map)["email"].toString(),
          );
        });
  }

  @override
  void initState() {
    renderSearchResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        //  width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search your contacts',
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => searchUser(),
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // padding: const EdgeInsets.only(left: 15.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: null,
                      ),
                    ),
                  )
                ],
              ),
            ),
            renderSearchResults()
          ],
        ),
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  final String userName;
  final String userEmail;

  const SearchResult({Key key, this.userName, this.userEmail})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(userName),
              Text(userEmail),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text('Message'),
            ),
          ),
        ],
      ),
    );
  }
}
