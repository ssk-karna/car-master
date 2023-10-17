import 'package:connectus_dummy/models/car_response.dart';
import 'package:connectus_dummy/views/components/image_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/Strings.dart';
import '../utils/color_set.dart';
import '../viewmodels/car_viewmodel.dart';
import 'components/row_text_widget.dart';

class ModifiedCarScreen extends StatelessWidget {
  final CarViewModel carViewModel = CarViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Car Master'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Pop the current screen
            },
          ),
        ),
        body: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(onPressed: (){},
                    child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(Strings.addMore))),
              ),
            ),
            Expanded(
              child: FutureBuilder<CarResponse>(
                future: carViewModel.fetchCarData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final car = snapshot.data;
                    return ListView.builder(
                      itemCount: car!.data.length,
                      itemBuilder: (context, index) {
                        final carData = car.data[index];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorSet.primaryBorder), // Add a border
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: ColorSet.primaryBorder,
                                blurRadius: 1,// Shadow color
                              ),
                            ],// Customize border radius
                          ),
                          child: Card(
                            color: ColorSet.primaryBackground,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Table(
                                  border: TableBorder.all(color: Colors.transparent), // Remove borders
                                  children: [
                                    // Add rows as TableRow widgets
                                    TableRow(
                                      children: [
                                        TableCell(
                                            child: Align(
                                                alignment: Alignment.centerRight ,
                                                child: RowTextWidget(text:"${Strings.rc_no} :", isLabel: true,))
                                        ),
                                        TableCell(
                                            child: RowTextWidget(text:"${carData.rcNumber}")
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        TableCell(
                                            child: Align(
                                                alignment: Alignment.centerRight ,
                                                child: RowTextWidget(text:"${Strings.car_name} :", isLabel: true,))
                                        ),
                                        TableCell(
                                            child: RowTextWidget(text:"${carData.model}")
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        TableCell(
                                            child: Align(
                                                alignment: Alignment.centerRight ,
                                                child: RowTextWidget(text:"${Strings.model} :", isLabel: true,))
                                        ),
                                        TableCell(
                                            child: RowTextWidget(text:"${carData.model}")
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        TableCell(
                                            child: Align(
                                                alignment: Alignment.centerRight ,
                                                child: RowTextWidget(text:"${Strings.capacity} :", isLabel: true,))
                                        ),
                                        TableCell(
                                            child: RowTextWidget(text:"${carData.capacity}")
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        TableCell(
                                            child: Align(
                                                alignment: Alignment.centerRight ,
                                                child: RowTextWidget(text:"${Strings.attachments} :", isLabel: true,))
                                        ),
                                        TableCell(
                                            child: RowTextWidget(text:"")
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        TableCell(
                                            child: Align(
                                                alignment: Alignment.centerRight ,
                                                child: RowTextWidget(text:"1 : ${Strings.carPhoto}", isLabel: true,))
                                        ),
                                        TableCell(
                                            child: RowTextWidget(text:"")
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        TableCell(
                                            child: Align(
                                                alignment: Alignment.centerRight ,
                                                child: RowTextWidget(text:"2 : ${Strings.carInsurance}", isLabel: true,))
                                        ),
                                        TableCell(
                                            child: RowTextWidget(text:"")
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        TableCell(
                                            child: Align(
                                                alignment: Alignment.centerRight ,
                                                child: RowTextWidget(text:"3 : ${Strings.carRC}", isLabel: true,))
                                        ),
                                        TableCell(
                                            child: RowTextWidget(text:"")
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                CustomCardWithImages(imageUrls: carViewModel.getImageUrls(carData))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}