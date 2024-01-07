import 'package:flutter/material.dart';

import '../database_helper/db_helper.dart';
class PracticeTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DatabaseHelper databaseHelper = DatabaseHelper();
    return FutureBuilder<List<String>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<String> bookName = snapshot.data ?? [];
            return Column(
              children: [
                ListView.builder(
                  itemCount: bookName.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 4,
                      ),
                      child: ExpansionTile(

                        collapsedBackgroundColor: Colors.black12,
                        leading: Container(
                          height: 350,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.blueGrey,
                            image: DecorationImage(
                              image: AssetImage("assets/image/book_one.png"),
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('books[index]',style: TextStyle(color: Colors.red),),
                            const Text(
                              "Dummy Data 2",
                              style: TextStyle(color: Colors.black, fontSize: 10),
                            ),
                            const Text(
                              "Dummy Data 3",
                              style: TextStyle(color: Colors.black, fontSize: 8),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_drop_down),
                        children: [
                          ExpansionTile(
                            title: Text('Expand me', style: TextStyle(color: Colors.red),),
                            children: <Widget>[
                            ],
                          ),
                          ExpansionTile(
                            title: Text('Expand me', style: TextStyle(color: Colors.red),),
                            children: <Widget>[
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          }
        },
        future: databaseHelper.getPracticeTest(),

    );
  }
}
