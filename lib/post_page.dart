import 'package:flutter/material.dart';
import 'package:santia/detail_post.dart';
import 'package:santia/get_post_model.dart';
import 'get_post.dart';

class PostPage extends StatelessWidget {
  final GetPost _getPost = new GetPost();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data Dari API'),
      ),
      body: FutureBuilder(
        future: _getPost.manggilPostData(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> dataPost = snapshot.data;
            return ListView.builder(
              itemCount: dataPost.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.android,
                            size: 30,
                            color: Colors.amber,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                dataPost[index].title,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => DetailPost(
                                        id: dataPost[index].id,
                                        userId: dataPost[index].userId,
                                        title: dataPost[index].title,
                                        body: dataPost[index].body,
                                      ),
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 80,
                                      height: 30,
                                      color: Colors.yellow,
                                      child: Center(
                                        child: Text('Lihat Detail'),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
