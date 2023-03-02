import 'package:flutter/material.dart';
import 'package:mmdapp_doctor/services/auth/doctorService.dart';

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
    return FutureBuilder<List<dynamic>>(
      future: getCustomers(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No suggestions found'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final suggestion = snapshot.data![index];
              return ListTile(
                title: Text(suggestion['first_name']),
                onTap: () {
                  print("called");
                  close(context, suggestion);
                },
              );
            },
          );
        }
      },
    );
  }
}

class SearchCustomer extends StatefulWidget {
  final TextEditingController controller;
  const SearchCustomer({required this.controller});

  @override
  State<SearchCustomer> createState() => _SearchCustomerState();
}

class _SearchCustomerState extends State<SearchCustomer> {
  final TextEditingController controller = TextEditingController();

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
                controller: controller,
                onChanged: (value) async {
                  widget.controller.text = '';
                  controller.text = '';
                  Map? result = await showSearch<Map>(
                    context: context,
                    delegate: MySearchDelegate(options: ['s']),
                  );

                  if (result != null) {
                    widget.controller.text = result['id'].toString();
                    controller.text = result['first_name'];
                  }
                },
                onTap: () async {
                  Map? result = await showSearch<Map>(
                    context: context,
                    delegate: MySearchDelegate(options: ['s']),
                  );

                  if (result != null) {
                    widget.controller.text = result['id'].toString();
                    controller.text = result['first_name'];
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
