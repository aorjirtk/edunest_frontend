import 'package:flutter/material.dart';
import 'package:my_flutter_app/screen/loan_dashboard/local_widgets/loan_view_details.dart';
import 'package:my_flutter_app/styles/theme.dart';

class ViewLoanScreen extends StatefulWidget {
  const ViewLoanScreen({super.key});

  @override
  State<ViewLoanScreen> createState() => _ViewLoanScreenState();
}

class _ViewLoanScreenState extends State<ViewLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Details", style: AppTheme.headerStyle(),),
      ),

      body:  Padding(padding: EdgeInsets.all(20), 
      child: Column(
        children: [
          LoanViewDetails(titleText: "Emergency loan", headerText: "Loan Name"),
          LoanViewDetails(titleText: "\$55,0000", headerText: "Loan Amount"),

          Column(
            children: [
              Text("Loan Document",
              style: AppTheme.headerStyle(),
              )
            ],
          )
        ],
      ),
      ),
    );
  }
}