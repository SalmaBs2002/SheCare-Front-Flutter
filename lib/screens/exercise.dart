import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart'; // Import audio player package
import 'custom_navigation_bar.dart'; // Import your custom navigation bar

class Video {
  final String title;
  final String assetPath; // Path to the local asset video
  bool isWatched; // Track if the video is watched

  Video({required this.title, required this.assetPath, this.isWatched = false});
}

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  VideoPlayerController? _controller;
  AudioPlayer _audioPlayer = AudioPlayer(); // Audio player instance
  bool _showCompletionMessage = false;
  int completedVideos = 0;

  // List of videos
  final List<Video> videos = [
    Video(title: "Step 1", assetPath: "assets/videos/step1.mp4"),
    Video(title: "Step 2", assetPath: "assets/videos/step2.mp4"),
    Video(title: "Step 3", assetPath: "assets/videos/step3.mp4"),
    Video(title: "Step 4", assetPath: "assets/videos/step4.mp4"),
    Video(title: "Step 5", assetPath: "assets/videos/step5.mp4"),
    Video(title: "Step 6", assetPath: "assets/videos/step6.mp4"),
  ];

  @override
  void dispose() {
    _controller?.dispose();
    _audioPlayer.dispose(); // Dispose audio player
    super.dispose();
  }

  void _playVideo(String assetPath, int index) {
    // Initialize the video player
    _controller = VideoPlayerController.asset(assetPath)
      ..initialize().then((_) {
        setState(() {
          _controller!.play();
        });

        // Add a listener to track when the video ends
        _controller!.addListener(() {
          if (_controller!.value.position == _controller!.value.duration) {
            _controller!.pause();
            setState(() {
              if (!videos[index].isWatched) {
                videos[index].isWatched = true; // Mark as watched
                completedVideos++;
              }
              if (completedVideos == videos.length) {
                _showCompletionMessage = true; // Show completion message
                _playApplauseSound(); // Play applause sound
              }
            });
          }
        });

        // Show the video in a dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(videos[index].title),
              content: AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _controller!.pause();
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      });
  }

  void _playApplauseSound() {
    // Play the applause sound
    _audioPlayer.play(AssetSource('assets/videos/sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/ex_pic.png',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      final video = videos[index];
                      return GestureDetector(
                        onTap: () => _playVideo(video.assetPath, index),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Stack(
                            children: [
                              // Background image for each step
                              Positioned.fill(
                                child: Image.asset(
                                  'assets/step_image.png',  // Image for each step
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Play button on top of the image
                              Center(
                                child: Icon(
                                  Icons.play_circle_fill,
                                  color: video.isWatched ? Colors.white : Colors.pink.shade300,
                                  size: 50,
                                ),
                              ),
                              // Title in white at the bottom of the image
                              Positioned(
                                bottom: 10,
                                left: 10,
                                right: 10,
                                child: Text(
                                  video.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,  // Title in white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          if (_showCompletionMessage)
            Container(
              color: Colors.black54,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.celebration, color: Colors.orange, size: 100),
                  SizedBox(height: 20),
                  Text(
                    "Good Job! 🎉",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "You've completed all the steps!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showCompletionMessage = false;
                      });
                    },
                    child: Text("Close"),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
