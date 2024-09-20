import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'onb_content.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: SingleChildScrollView(  // Prevent overflow by enabling scrolling
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,  // Center the content
                      children: [
                        SvgPicture.asset(
                          contents[i].image,
                          height: 250,  // Adjust image size for better fit
                        ),
                        SizedBox(height: 20),  // Add spacing between image and text
                        Text(
                          contents[i].title,
                          style: TextStyle(
                            fontSize: 30,  // Adjust title size if necessary
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),  // Add spacing before description
                        Text(
                          contents[i].description,  // The description text
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,  // Smaller font for the description
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  // Navigate to the next screen or home
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFFF885B),  // Button color
                foregroundColor: Colors.white,  // Text color
                padding: EdgeInsets.all(16),  // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                currentIndex == contents.length - 1 ? "Continue" : "Next",
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
