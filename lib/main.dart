import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ShippingPageWidget(),
    );
  }
}

class ShippingPageWidget extends StatefulWidget {
  @override
  _ShippingPageWidgetState createState() => _ShippingPageWidgetState();
}

class _ShippingPageWidgetState extends State<ShippingPageWidget> {
  List serviceData = ["LTL", "DTL", "RTL"];
  String selectedServiceItem = "LTL";
  String selectedTransitItem = "LTL";
  String requestedPickUpTime = "LTL";
  String actualPickUPTime = "DTL";
  TextEditingController shipperController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController bolController = TextEditingController();

  bool pickUpFromConstruction = false;
  bool pickUpFromCourier = false;
  bool pickUpFromDrayage = false;
  bool pickUpFromDroppedTrailer = false;
  bool pickUpFromInside = false;

  Map shipmentForm;

  submitShipmentForm(){

     shipmentForm = {
      "shipper": shipperController.text,
       "location": locationController.text,
       "bol": bolController.text,
       "service_mode": selectedServiceItem,
       "transit_mode": selectedTransitItem,
       "pickup_service": "",
       "data_pickup_requested": requestedPickUpTime,
       "actual_pickup": actualPickUPTime
    };
     print("Response ${shipmentForm}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
            height: 50.0,
            width: 50.0,
            child: Image.asset('assets/images/JW_logo.png'),
            decoration: BoxDecoration(shape: BoxShape.circle),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
            Container(
              height: 48.0,
              width: 48.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 15.0,
                backgroundImage: ExactAssetImage(
                  "assets/images/profile_pic.jpg",
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            )
          ],
        ),
        drawer: Drawer(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15.0),
                  height: 60,
                  width: 500,
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Create Shipment',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text('Step 1 of 6 - Shipper'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      _stepListItems(
                          stepCount: '1',
                          containerColor: Colors.black,
                          textColor: Colors.white,
                          borderColor: Colors.white),
                      divider(),
                      _stepListItems(
                          stepCount: '2',
                          containerColor: Colors.white,
                          textColor: Colors.black,
                          borderColor: Colors.grey),
                      divider(),
                      _stepListItems(
                          stepCount: '3',
                          containerColor: Colors.white,
                          textColor: Colors.black,
                          borderColor: Colors.grey),
                      divider(),
                      _stepListItems(
                          stepCount: '4',
                          containerColor: Colors.white,
                          textColor: Colors.black,
                          borderColor: Colors.grey),
                      divider(),
                      _stepListItems(
                          stepCount: '5',
                          containerColor: Colors.white,
                          textColor: Colors.black,
                          borderColor: Colors.grey),
                      divider(),
                      _stepListItems(
                          stepCount: '6',
                          containerColor: Colors.white,
                          textColor: Colors.black,
                          borderColor: Colors.grey),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 5.0),
                    child: RichText(
                      text: TextSpan(
                        text: '*',
                        style:
                            TextStyle(color: Colors.red[300], fontSize: 15.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Indicates Required Field',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87)),
                        ],
                      ),
                    )),
                formFields(),
              ],
            ),
          ),
        ));
  }

  divider() {
    return Container(
      width: 38.0,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[400]),
        ),
      ),
    );
  }

  formFields() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: new InputDecoration(
              focusColor: const Color(0xffff6771),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(style: BorderStyle.solid, width: 1.0)),
              contentPadding: EdgeInsets.all(15.0),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Container(
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.grey))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 15.0, 17.0, 0.0),
                  child: Text(
                    'Shipper',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 0.0),
                child: Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
              ),
              hintText: 'Company Name',
              hintStyle: TextStyle(color: Colors.grey[300], fontSize: 20.0),
              hasFloatingPlaceholder: true,
            ),
          ),
          TextField(
            decoration: new InputDecoration(
              focusColor: const Color(0xffff6771),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(style: BorderStyle.solid, width: 1.0)),
              contentPadding: EdgeInsets.all(15.0),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Container(
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.grey))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 8.0, 0.0),
                  child: Text(
                    'Location',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 0.0),
                child: Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
              ),
              hintText: 'Address',
              hintStyle: TextStyle(color: Colors.grey[300], fontSize: 20.0),
              hasFloatingPlaceholder: true,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            decoration: new InputDecoration(
              focusColor: const Color(0xffff6771),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(style: BorderStyle.solid, width: 1.0)),
              contentPadding: EdgeInsets.all(15.0),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Container(
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.grey))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 25.0, 0.0),
                  child: Text(
                    'BOL #',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              hintText: 'Optional',
              hintStyle: TextStyle(color: Colors.grey[300], fontSize: 20.0),
              hasFloatingPlaceholder: true,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Service Mode',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Container(
                        child: DropdownButtonFormField<String>(
                          value: selectedServiceItem,
                          decoration: new InputDecoration(
                              focusColor: const Color(0xffff6771),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0)),
                                  borderSide: BorderSide(
                                      style: BorderStyle.none, width: 0.0)),
                              contentPadding:
                                  EdgeInsets.only(top: 10.0, bottom: 10.0),
                              filled: true,
                              fillColor: Colors.grey[300],
                              hintText: 'Select Service Mode',
                              hintStyle: TextStyle(
                                fontSize: 12.0,
                              )),
                          items: serviceData.map((var value) {
                            return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ));
                          }).toList(),
                          onChanged: (String value){
                            setState(() {
                              selectedServiceItem = value;
                            });
                          },
                          validator: (String value) {
                            if (value == null) {
                              return 'Please select service mode';
                            }
                          },
                        ),
                        padding: EdgeInsets.only(
                          top: 10.0,
                          left: 6.0,
                          right: 6.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Transit Service',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Container(
                        child: DropdownButtonFormField<String>(
                          value: selectedTransitItem,
                          decoration: new InputDecoration(
                              focusColor: const Color(0xffff6771),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0)),
                                  borderSide: BorderSide(
                                      style: BorderStyle.none, width: 0.0)),
                              contentPadding:
                                  EdgeInsets.only(top: 10.0, bottom: 10.0),
                              filled: true,
                              fillColor: Colors.grey[300],
                              hintText: 'Select One Mode',
                              hintStyle: TextStyle(
                                fontSize: 12.0,
                              )),
                          items: serviceData.map((var value) {
                            return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ));
                          }).toList(),
                          onChanged: (String value){
                            setState(() {
                              selectedTransitItem = value;
                            });
                          },
                          validator: (String value) {
                            if (value == null) {
                              return 'Please select transit service';
                            }
                          },
                        ),
                        padding: EdgeInsets.only(
                          top: 10.0,
                          left: 6.0,
                          right: 6.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          _checkBoxItems(),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Date PickUp Requested',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Container(
                        child: DropdownButtonFormField<String>(
                          value: requestedPickUpTime,
                          decoration: new InputDecoration(
                              focusColor: const Color(0xffff6771),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0)),
                                  borderSide: BorderSide(
                                      style: BorderStyle.none, width: 0.0)),
                              contentPadding:
                                  EdgeInsets.only(top: 10.0, bottom: 10.0),
                              filled: true,
                              fillColor: Colors.grey[300],
                              hintText: 'Select Date ...',
                              hintStyle: TextStyle(
                                fontSize: 12.0,
                              )),
                          items: serviceData.map((var value) {
                            return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ));
                          }).toList(),
                          onChanged: (String value){
                            setState(() {
                              requestedPickUpTime = value;
                            });
                          },
                          validator: (String value) {
                            if (value == null) {
                              return 'Please select service mode';
                            }
                          },
                        ),
                        padding: EdgeInsets.only(
                          top: 10.0,
                          left: 6.0,
                          right: 6.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Date PickUp Actual',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Container(
                        child: DropdownButtonFormField<String>(
                          value: actualPickUPTime,
                          decoration: new InputDecoration(
                              focusColor: const Color(0xffff6771),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0)),
                                  borderSide: BorderSide(
                                      style: BorderStyle.none, width: 0.0)),
                              contentPadding:
                                  EdgeInsets.only(top: 10.0, bottom: 10.0),
                              filled: true,
                              fillColor: Colors.grey[300],
                              hintText: 'Select Date ...',
                              hintStyle: TextStyle(
                                fontSize: 12.0,
                              )),
                          items: serviceData.map((var value) {
                            return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ));
                          }).toList(),
                          onChanged: (String value){
                            setState(() {
                              actualPickUPTime = value;
                            });
                          },
                          validator: (String value) {
                            if (value == null) {
                              return 'Please select actual pickup time';
                            }
                          },
                        ),
                        padding: EdgeInsets.only(
                          top: 10.0,
                          left: 6.0,
                          right: 6.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          _formButtons(),
          SizedBox(
            height: 25.0,
          )
        ],
      ),
    );
  }

  _stepListItems(
      {String stepCount,
      Color textColor,
      Color borderColor,
      Color containerColor}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        stepCount,
        style: TextStyle(color: textColor),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: containerColor,
          border: Border.all(color: borderColor, width: 2.0)),
    );
  }

  _formButtons() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
              onPressed: () {
                debugPrint('Back Button Pressed');
              },
              child: Text(
                'Back',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              )),
          RaisedButton(
            onPressed: () {
              debugPrint('Back Button Pressed');
              submitShipmentForm();
            },
            child: Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            color: Colors.black87,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            padding: EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 15.0),
          ),
        ],
      ),
    );
  }

  _checkBoxItems() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20.0, left: 8.0),
          alignment: Alignment.topLeft,
          child: Text(
            'Pickup Services',
            style: const TextStyle(
                color: const Color(0xff464d5e),
                fontWeight: FontWeight.w700,
                fontFamily: "Quicksand",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        value: pickUpFromConstruction,
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          setState(() {
                            pickUpFromConstruction = value;
                          });
                        }),
                    Text(
                      'Construction Site',
                      style: TextStyle(color: Colors.black54, fontSize: 15.0),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        value: pickUpFromCourier,
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          setState(() {
                            pickUpFromCourier = value;
                          });
                        }),
                    Text(
                      'Courier Service',
                      style: TextStyle(color: Colors.black54, fontSize: 15.0),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        value: pickUpFromDrayage,
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          setState(() {
                            pickUpFromDrayage = value;
                          });
                        }),
                    Text(
                      'Drayage Service',
                      style: TextStyle(color: Colors.black54, fontSize: 15.0),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        value: pickUpFromDroppedTrailer,
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          setState(() {
                            pickUpFromDroppedTrailer = value;
                          });
                        }),
                    Text(
                      'Dropped Trailer',
                      style: TextStyle(color: Colors.black54, fontSize: 15.0),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        value: pickUpFromInside,
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          setState(() {
                            pickUpFromInside = value;
                          });
                        }),
                    Text(
                      'Inside Trailer',
                      style: TextStyle(color: Colors.black54, fontSize: 15.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
