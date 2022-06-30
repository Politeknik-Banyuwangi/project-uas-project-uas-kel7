import 'package:flutter/material.dart';

class Riwayat extends StatelessWidget {
  Riwayat({Key});

  final List tglJam = [
    "Senin, 2 April 2022 - 06:15:00 WIB",
    "Senin, 2 April 2022 - 06:35:10 WIB",
    "Senin, 2 April 2022 - 06:45:50 WIB",
    "Senin, 2 April 2022 - 06:20:40 WIB",
    "Senin, 2 April 2022 - 06:55:50 WIB"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/detail');
                },
                title: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          tglJam[index],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Tampilkan semua.....",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: tglJam.length,
      ),
    );
  }
}
