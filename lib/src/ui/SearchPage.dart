import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:github_search/src/blocs/SearchBloc.dart';
import 'package:github_search/src/ui/DetailsPage.dart';
import 'package:github_search/src/models/SearchItem.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc _searchBloc;

  @override
  void initState() {
    _searchBloc = SearchBloc();
    super.initState();
  }

  @override
  void dispose() {
    _searchBloc?.dispose();
    super.dispose();
  }

  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: _searchBloc.searchEvent.add,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Digite o nome do repositório",
            labelText: "Pesquisa"),
      ),
    );
  }

  Widget _items(SearchItem item) {
    return ListTile(
      leading: Hero(
        tag: item.url,
        child: CircleAvatar(
          backgroundImage: NetworkImage(item?.avatarUrl ??
              "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png"),
        ),
      ),
      title: Text(item?.fullName ?? "title"),
      subtitle: Text(item?.url ?? "url"),
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => DetailsPage(
                    item: item,
              )
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Search"),
      ),
      body: ListView(
        children: <Widget>[
          _textField(),
          StreamBuilder<List<SearchItem>>(
              stream: _searchBloc.apiResultFlux,
              builder: (BuildContext context,
                  AsyncSnapshot<List<SearchItem>> snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          SearchItem item = snapshot.data[index];
                          return _items(item);
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        ],
      ),
    );
  }
}
