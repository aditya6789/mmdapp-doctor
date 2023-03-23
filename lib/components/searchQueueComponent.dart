import 'package:flutter/material.dart';
import 'package:mmdapp_doctor/services/auth/doctorServices.dart';

class Customer {
  final String id;
  final String name;

  Customer({required this.id, required this.name});
}

class MySearchDelegate extends SearchDelegate<Map> {
  final List<String> options;

  MySearchDelegate({required this.options});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, {});
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getQueueCustomers(query: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No suggestions found'));
        } else {
          if (snapshot.data!.containsKey('data')) {
            List<dynamic> records = snapshot.data!['data'];

            print(records);

            return (records.isEmpty ?? true)
                ? Center(
                    child: Text("No Customer In The Queue"),
                  )
                : ListView.builder(
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      final suggestion = records[index];
                      return ListTile(
                        leading: Icon(Icons.person_2_rounded),
                        title: Text(
                          suggestion['customer_name'] == ''
                              ? 'No Name'
                              : suggestion['customer_name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          print("called");
                          close(context, suggestion);
                        },
                      );
                    },
                  );
          } else {
            return Center(child: Text('No suggestions found 2'));
          }
        }
      },
    );
  }
}

class SearchQueue extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController selectedController;
  const SearchQueue(
      {required this.controller, required this.selectedController});

  @override
  State<SearchQueue> createState() => _SearchQueueState();
}

class _SearchQueueState extends State<SearchQueue> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            SizedBox(width: 8.0),
            Icon(Icons.search),
            SizedBox(width: 8.0),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search Customer',
                  border: InputBorder.none,
                ),
                controller: widget.selectedController,
                onChanged: (value) async {
                  widget.controller.text = '';
                  widget.selectedController.text = '';
                  Map? result = await showSearch<Map>(
                    context: context,
                    delegate: MySearchDelegate(options: ['s']),
                  );

                  if (result != null) {
                    widget.controller.text = result['id'].toString() ?? '';
                    widget.selectedController.text =
                        result['customer_name'] ?? "";
                  }
                },
                onTap: () async {
                  Map? result = await showSearch<Map>(
                    context: context,
                    delegate: MySearchDelegate(options: ['s']),
                  );

                  if (result != null) {
                    widget.controller.text = result['id'].toString() ?? '';
                    widget.selectedController.text =
                        result['customer_name'] ?? '';
                  }
                },
              ),
            ),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}
