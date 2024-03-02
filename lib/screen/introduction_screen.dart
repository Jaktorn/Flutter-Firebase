import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'คนที่ไม่รู้',
      body: ':D',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('อยากรู้'),
        ),
      ),
      image: Image.network(
          'https://external-preview.redd.it/OZTp9UzktsRsQbsj-jjCN9gg2dUgNXU5B1lS9pRtvls.png?format=pjpg&auto=webp&s=719ec3a8d24249b120ec792742dfb32752e613df'),
    ),
    PageViewModel(
      title: 'คนที่รู้',
      body: 'X_X',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('อย่ารู้เลย'),
        ),
      ),
      image: Image.network(
          'https://th.bing.com/th/id/R.4974523c3adf99c8c18fefc02c777b4b?rik=A1%2f4iDumCkVykA&pid=ImgRaw&r=0'),
    ),
    PageViewModel(
      title: 'คนที่แกล้งทำเป็นรู้',
      body: 'compile error',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('big brain small dick'),
        ),
      ),
      image: Image.network('https://i.redd.it/f34o85qhw9u61.jpg'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Who know?'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 104, 104, 104),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: IntroductionScreen(
                globalBackgroundColor: Color.fromARGB(255, 104, 104, 104),
                pages: pages,
                showSkipButton: true,
                skip: const Text('Skip',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Colors.black)),
                showDoneButton: true,
                done: const Text('Finish',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Colors.black)),
                showNextButton: true,
                next: const Icon(Icons.arrow_right),
                onDone: () => onDone(context),
                curve: Curves.bounceOut,
                dotsDecorator: const DotsDecorator(
                    size: Size(10, 10),
                    color: Colors.lightBlue,
                    activeColor: Colors.blue,
                    activeSize: Size.square(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
