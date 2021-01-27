import 'package:flutter/material.dart';

class TenPlusOnePlan extends StatefulWidget {
  @override
  _TenPlusOnePlanState createState() => _TenPlusOnePlanState();
}

class _TenPlusOnePlanState extends State<TenPlusOnePlan> {
  int _payableUserAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Card(
              child: Container(
                width: 150,
                height: 70,
                decoration: BoxDecoration(
                    //color: Colors.purpleAccent.shade100,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Enter Payable EMI Amount",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                          color: Colors.grey.shade700),
                    ),
                    TextField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          //prefixText: "Bill Amount",
                          prefixIcon: Icon(Icons.attach_money)),
                      onChanged: (String value) {
                        setState(() {
                          try {
                            _payableUserAmount = int.parse(value);
                          } catch (exception) {
                            _payableUserAmount = 0;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "1st EMI(50% OFF):",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Rs. ${calculateFirstEmi(_payableUserAmount)}",
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 17.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "9th EMI:",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Rs.${_payableUserAmount}",
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 17.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "11th EMI(100% OFF):",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Rs.0",
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 17.0),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(

                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Total Purchase Amount",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                          color: Colors.grey.shade700),
                    ),
                    Text(
                      "Rs. ${calculateTotalPurchaseAmount(_payableUserAmount)}",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 19.0,)
                    ),
                    Text(
                      "Your Savings",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                          color: Colors.grey.shade700),
                    ),
                    Text(
                        "Rs. ${calculateTotalSavings(_payableUserAmount)}",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 19.0,)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
calculateFirstEmi(int userAmount) {
  var firstEmi = userAmount / 2;

  return firstEmi;
}
calculateTotalPurchaseAmount(int userAmount) {
  var firstEmi = userAmount * 11;

  return firstEmi;
}

calculateTotalSavings(int userAmount) {
  var firstEmi = userAmount / 2;

  var totalSavings = firstEmi + userAmount;

  return totalSavings;
}




