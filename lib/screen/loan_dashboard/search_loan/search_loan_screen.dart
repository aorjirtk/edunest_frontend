import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:my_flutter_app/config/extension.dart';
import 'package:my_flutter_app/screen/loan_dashboard/local_widgets/loan_info_card.dart';
import 'package:my_flutter_app/styles/colors.dart';
import 'package:my_flutter_app/styles/theme.dart';

class SearchLoanScreen extends StatefulWidget {
  const SearchLoanScreen({super.key});

  @override
  State<SearchLoanScreen> createState() => _SearchLoanScreenState();
}

class _SearchLoanScreenState extends State<SearchLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Loan", style: AppTheme.headerStyle(),),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(TextEditingController(), hint: "Enter Loan Name",
            password: false,
            border: Border.all(color: greyColor),
            ),
            20.height(),

            Expanded(
              child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10), children: List.generate(2, (index){
                return LoanInfoCard(isLoaned: true, onTap: (){});
              }
              ),
              
               ),
            )
          ]
        ),
      ),
    );
  }
}