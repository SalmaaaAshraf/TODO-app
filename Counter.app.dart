import 'package:flutter/material.dart';

class Counter.app extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Counter App Provider',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
          elevation: 50.0,
        ),
        body: Column(
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Value',
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                onPressed: () {
                                },
                                backgroundColor: Colors.white,
                                mini: true,
                                child: Icon(
                                    Icons.remove
                                )
                            ),
                            FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.white,
                                mini: true,
                                child: Icon(
                                    Icons.add
                                )
                            )
                          ],
                        )


                      ],
                    )
                  ],
                )
            )
          ],
        )


    );
  }
}