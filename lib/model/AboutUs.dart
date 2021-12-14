class AboutUs {
  String title;
  String imageUrl;
  String imageUrl2;
  String title2;

  AboutUs({
    required this.title,
    required this.title2,
    required this.imageUrl,
    required this.imageUrl2,
  });
}

List<AboutUs> aboutusList = [
  AboutUs(
      title: 'About Interview Bot',
      title2:
          'Emerging technologies, like AI-powered bots has a huge impact to the organizations or job applicants since they provide quicker resolutions and simplify the job of an Interviewer agent. Being able to balance speed and personalization will lead to increase job applicants satisfaction levels as well as the reputational benefits that follows.',
      imageUrl2:  "assets/images/AboutInterview_icon.png",
      imageUrl: "assets/images/AboutInterview_icon.png"),
  AboutUs(
      title: 'Our Mission',
      title2:
          ' To provide customer support to the applicants as well as in organization.',
      imageUrl2:  "assets/images/Mission.png",
      imageUrl: "assets/images/Mission.png"),
  AboutUs(
      title: 'Meet Our Team',
      title2: 'Interview Bot Team',
      imageUrl2: "assets/images/team.png",
      imageUrl: "assets/images/OurTeam.png"),
];
