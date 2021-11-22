import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 36),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                              colors: [Colors.yellow.shade700, Colors.yellow.shade300]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlutterLogo(size: 48),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Job Title',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                  ),
                                  Text('Some description',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                  )],
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              size: 36,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
