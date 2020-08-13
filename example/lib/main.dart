import 'package:flutter/material.dart';
import 'package:youtube_api_v3/youtube_api_v3.dart';

var apiKey = '';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Video> videos = new List();
  PlayListItemListResponse currentPage;

  @override
  void initState() {
    super.initState();
    getMusic();
  }

  setVideos(videos) {
    setState(() {
      this.videos = videos;
    });
  }

  Future<List<PlayListItem>> getMusic() async {
    YoutubeAPIv3 api = new YoutubeAPIv3(apiKey);

    final playlistT = await api.playListItems(
        playlistId: 'PLhmELlzojXqhS9dsOUrT2AIblgKh-GGzE', maxResults: 2);
    print(playlistT);

    PlayListItemListResponse playlist = await api.playListItems(
        playlistId: 'PLTfigAbxBUNpoZ1OspADCabQ5meRDmPlP', maxResults: 5);
    var videos = playlist.items.map((video) {
      return video;
    });
    currentPage = playlist;
    this.videos.addAll(videos);
    setVideos(this.videos);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: videos.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (videos.length == index) {
            return RaisedButton(
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              child: Text(
                'Load More',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          var video = videos[index];
          return Card(
              margin: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                Text(video.snippet.title),
                Image(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(video.snippet.thumbnails.medium.url)),
              ]));
        },
      )),
    );
  }
}
