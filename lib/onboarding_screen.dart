import 'package:first_project/register_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  List<OnBoardingModel> onboardingList = [
    OnBoardingModel(
        title: "Choose Product",
        image: "assets/images/onboardingImage1.PNG",
        description:
        "We have 100k+ Products Choose \n Your Product from out E-\n commerce shop"),
    OnBoardingModel(
        title: "Easy Safe Payment",
        image: "assets/images/onboardingImage2.PNG",
        description:
        "We have 100k+ Products Choose \n Your Product from out E-\n commerce shop"),
    OnBoardingModel(
        title: "Track Your Order",
        image: "assets/images/onboardingImage3.PNG",
        description:
        "We have 100k+ Products Choose \n Your Product from out E-\n commerce shop"),
    OnBoardingModel(
        title: "Fast Delivery",
        image: "assets/images/onboardingImage4.PNG",
        description:
        "We have 100k+ Products Choose \n Your Product from out E-\n commerce shop"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PageView.builder(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) =>
                            OnBoardingBody(
                                title: onboardingList[index].title,
                                image: onboardingList[index].image,
                                description: onboardingList[index].description),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                  4, (index) => dotIndicator(index, currentIndex)),
                            ],
                          ),
                          const Spacer(),
                          // Button
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: MaterialButton(
                                  onPressed: () async {
                                    pageController.nextPage(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                    if (currentIndex == 3){
                                      await Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => const RegisterScreen()));
                                      // Navigator.of(context).pop();
                                    }

                                  },
                                  child: Text(
                                    currentIndex == 3 ? "Continue" : "Next",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody(
      {super.key,
        required this.title,
        required this.image,
        required this.description});

  final String? title;
  final String? image;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          title!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Image.asset(
          image!,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        const Spacer(),
        Text(
          description!,
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    );
  }
}

Widget dotIndicator(int index, currentIndex) {
  return AnimatedContainer(
    margin: const EdgeInsets.only(right: 3),
    width: currentIndex == index ? 15 : 6,
    height: 8,
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(3)),
    duration: const Duration(milliseconds: 300),
  );
}

class OnBoardingModel {
  String? title;
  String? image;
  String? description;

  OnBoardingModel(
      {required this.title, required this.image, required this.description});
}
