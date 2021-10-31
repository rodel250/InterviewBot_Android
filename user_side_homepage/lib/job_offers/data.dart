class NavigationItem {
  String title;
  NavigationItem(this.title);
}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem("Applied Jobs"),
    NavigationItem("Saved Jobs"),
  ];
}

class Application {
  String position;
  String company;
  String status;
  String price;
  String logo;

  Application(this.position, this.company, this.status, this.price, this.logo);
}

List<Application> getApplications(){
  return <Application>[
    Application("Customer Service Representative", "Convergys", "Applied", "85", "assets/images/convergys.png"),
    Application("System Administrator", "Lexmark Cebu", "Viewed", "120", "assets/images/lexmark.png"),
  ];
}

class Job {
  String position;
  String company;
  String price;
  String concept;
  String logo;
  String city;

  Job(this.position, this.company, this.price, this.concept, this.logo, this.city);
}

List<Job> getJobs(){
  return <Job>[
    Job("Customer Service Representative", "Convergys", "85", "Full-Time", "assets/images/convergys.png", "Cebu City, Philippines"),
    Job("System Administrator", "Lexmark Cebu", "120", "Full-Time", "assets/images/lexmark.png", "Cebu City, Philippines"),
  ];
}

List<String> getJobsRequirements(){
  return <String>[
    "Exceptional communication skills and team-working skills",
    "Know the principles of IT industry and you can create high better system",
    "Direct experience using Adobe Premiere, Adobe After Effects & other tools used to create videos, animations, etc.",
    "Good system administration knowledge",
  ];
}