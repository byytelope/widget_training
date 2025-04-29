import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class ImageSwipingScreen extends StatelessWidget {
  const ImageSwipingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final images = [
      "assets/cat1.jpg",
      "assets/cat2.jpg",
      "assets/cat3.jpg",
      "assets/cat4.jpg",
      "assets/cat5.jpg",
      "assets/cat6.jpg",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Image Swiping")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 500,
            child: PageView.builder(
              controller: controller,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Image.asset(images[index], fit: BoxFit.cover),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: images.length,
            effect: WormEffect(
              activeDotColor: Theme.of(context).colorScheme.secondary,
              dotColor: Theme.of(context).colorScheme.secondaryContainer,
              dotWidth: 10.0,
              dotHeight: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
