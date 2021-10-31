import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Interviewbot/job_offers/data.dart';
import 'package:Interviewbot/job_offers/job_detail.dart';
import 'package:Interviewbot/login_register/color.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {

  List<Job> jobs = getJobs();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){
                },
              ),

              Row(
                children: [
                  
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){
                      setState(() {
                        this.isSearching = !this.isSearching;
                      });
                    },
                  ),

                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ],
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Padding(
                  padding: EdgeInsets.only(right: 32, left: 32, top: 8, bottom: 20),
                  child: Text(
                    "Hi User, \nFind your Dream Job",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Gotham Bold',
                        height: 1.2
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      buildFilterOption("Customer Service Representative"),
                      buildFilterOption("Cebu, Philippines"),
                      buildFilterOption(r"P85 - 125/hr"),
                      buildFilterOption("Full-Time"),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Text(
                    "Recommended jobs for you",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Gotham Bold',
                    ),
                  ),
                ),

                Container(
                  height: 190,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: buildRecommendations(),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Text(
                    "Recently added",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Gotham Bold',
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: buildLastJobs(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFilterOption(String text){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [gold,gold]),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8,),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Gotham Bold',
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.clear,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildRecommendations(){
    List<Widget> list = [];
    list.add(SizedBox(width: 32,));
    for (var i = 0; i < jobs.length; i++) {
      list.add(buildRecommendation(jobs[i]));
    }
    list.add(SizedBox(width: 16,));
    return list;
  }

  Widget buildRecommendation(Job job){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JobDetail(job: job)),
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [maroon,maroon]),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(job.logo),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4,),
                    child: Text(
                      job.concept,
                      style: TextStyle(
                        fontFamily: 'Gotham Bold',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

              ],
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Text(
                    job.position,
                    style: TextStyle(
                      fontFamily: 'Gotham Bold',
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  Text(
                    r"P" + job.price + "/hr",
                    style: TextStyle(
                      fontFamily: 'Gotham Bold',
                      fontSize: 24,
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  List<Widget> buildLastJobs(){
    List<Widget> list = [];
    for (var i = jobs.length - 1; i > -1; i--) {
      list.add(buildLastJob(jobs[i]));
    }
    return list;
  }

  Widget buildLastJob(Job job){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JobDetail(job: job)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          children: [

            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(job.logo),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),

            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        job.position,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gotham Bold',
                        ),
                      ),

                      Text(
                        job.company,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Gotham Bold',
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),
                )
            ),

            Text(
              r"P" + job.price + "/hr",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'GothamBook Regular',
              ),
            ),

          ],
        ),
      ),
    );
  }

}