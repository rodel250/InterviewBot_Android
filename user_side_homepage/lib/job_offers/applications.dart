import 'package:flutter/material.dart';
import 'package:Interviewbot/job_offers/data.dart';

class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {

  List<Application> applications = getApplications();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Padding(
            padding: EdgeInsets.only(right: 32, left: 32, top: 48, bottom: 32),
            child: Text(
              "Saved \nJobs (" + applications.length.toString() + ")",
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Gotham Bold',
                  height: 1.2
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 32, left: 32, bottom: 8),
            child: Column(
              children: buildApplications(),
            ),
          ),

        ],
      ),
    );
  }

  List<Widget> buildApplications(){
    List<Widget> list = [];
    for (var i = 0; i < applications.length; i++) {
      list.add(buildApplication(applications[i]));
    }
    return list;
  }

  Widget buildApplication(Application application){
    return Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(application.logo),
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
                          application.position,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Gotham Bold',
                          ),
                        ),

                        Text(
                          application.company,
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

              Icon(
                Icons.more_vert,
              ),
            ],
          ),

          SizedBox(
            height: 16,
          ),

          Row(
            children: [

              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      application.status,
                      style: TextStyle(
                        fontFamily: 'Gotham Bold',
                        fontSize: 16,
                        color: application.status == "Viewed" ? Colors.green[500] :
                        application.status == "Cancelled" ? Colors.red[500] : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      r"P" + application.price + "/hr",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'GothamBook Regular',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}