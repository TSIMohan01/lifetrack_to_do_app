class OnboardingContents {
  final String image;
  final String desc;

  OnboardingContents({required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    image: "assets/001.png",
    desc: "Save time and be productive\nby creating daily tasks.",
  ),
  OnboardingContents(
    image: "assets/002.png",
    desc: "Get that satisfying feeling\nwhen marking them done.",
  ),
  OnboardingContents(
    image: "assets/003.png",
    desc: "Reach your goals faster\nwith Lifetrack.",
  ),
];
