import 'package:flutter/material.dart';
import 'package:json_parsing_demo/NavBar.dart';
import 'package:json_parsing_demo/Search.dart';
import 'package:json_parsing_demo/provider/myHomePageProvider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _testController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('E-Banking',
            style: TextStyle(fontWeight: FontWeight.w400)),
      ),

      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.only(top: 10.0),
            child: Container(

              width: 500,
              child: TextField(
                controller: _testController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Keyword',
                  suffixIcon:
                    IconButton(
                        onPressed : () => {_testController.clear()},

                        icon: const Icon(Icons.clear))
                ),
              ),

            ),


          ),
          Container(
            margin:  const EdgeInsets.only(top: 10.0) ,
            child: MaterialButton(
              minWidth: 100,
              onPressed: (){},
              color: Colors.blue,
              child: Text('Search',style: TextStyle(color: Colors.white)),
            ),
          ),
          Container(
            height: 400,
            margin: const EdgeInsets.only(top: 30.0),
            child: ChangeNotifierProvider<MyHomePageProvider>(
              create: (context) => MyHomePageProvider(),
              child: Consumer<MyHomePageProvider>(
                builder: (context, provider, child) {
                  if (provider.data == null) {
                    provider.getData(context);
                    return Center(child: CircularProgressIndicator());
                  }
                  // when we have the json loaded... let's put the data into a data table widget
                  return Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
                      child: SingleChildScrollView(
                        child: DataTable(
                          sortColumnIndex: 0,
                          sortAscending: false,
                          columns: [
                            DataColumn(
                                label: Text('Verified',

                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                tooltip: 'represents if user is verified.'),
                            DataColumn(
                                label: Text('Nom',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                tooltip: 'represents first name of the user'),
                            DataColumn(
                                label: Text('Prenom',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                tooltip: 'represents last name of the user'),
                            DataColumn(
                                label: Text('Email',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                            DataColumn(
                                label: Text('Update',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                tooltip: 'Click to Update account'),
                            DataColumn(
                                label: Text('Delete',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                tooltip: 'Click to Delete account'),
                          ],
                          rows: provider.data.results
                              .map((data) =>
                                  // we return a DataRow every time
                                  DataRow(

                                      // List<DataCell> cells is required in every row
                                      cells: [

                                        DataCell((data.verified)
                                            ? Icon(
                                                Icons.verified_user,
                                                color: Colors.green,
                                              )
                                            : Icon(Icons.cancel, color: Colors.red)),
                                        // I want to display a green color icon when user is verified and red when unverified
                                        DataCell(Text(data.firstName)),
                                        DataCell(Text(data.lastName)),
                                        DataCell(Text(data.email)),
                                        DataCell(OutlinedButton(
                                          onPressed: () {
                                            // Respond to button press
                                          },
                                          child: Icon(Icons.build,color: Colors.green),
                                        )),
                                        DataCell(OutlinedButton(
                                          onPressed: () {
                                            // Respond to button press
                                          },
                                          child:  Icon(Icons.visibility_off,color: Colors.deepOrangeAccent),


                                        )),
                                      ]))
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
