import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'ids.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<YoutubePlayerController> controllers;

  @override
  void initState() {
    super.initState();

    controllers = ids.map<YoutubePlayerController>((video) {
      return YoutubePlayerController(
        initialVideoId: video['id'],
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: const Text('Watch It',style: TextStyle(color: Colors.white),),
        actions: const [
          Icon(Icons.search,color: Colors.white,),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.notifications,color: Colors.white,),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ids.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              YoutubePlayer(
                controller: controllers[index],
                showVideoProgressIndicator: true,
              ),
              Text(
                ids[index]['title'],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}