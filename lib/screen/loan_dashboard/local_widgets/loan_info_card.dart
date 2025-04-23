

import 'package:flutter/material.dart';
import 'package:my_flutter_app/config/extension.dart';
import 'package:my_flutter_app/styles/colors.dart';
import 'package:my_flutter_app/styles/theme.dart';

class LoanInfoCard extends StatelessWidget {
  final bool isLoaned;
  final Function() onTap;
   LoanInfoCard({super.key, required this.isLoaned, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 150,
        margin:  const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.outbond, 
                color:  isLoaned? redColor : greenColor,
                ),
      
                Expanded(child: Text(
                  "\$ 50,000",
                  textAlign: TextAlign.right,
                  style: AppTheme.subTitleStyle(),
                )
                )
              ],
            ),
              const Spacer(),
            Text('Student Loan',
            style: AppTheme.titleStyle(isBold: true),
            ),
            Text(isLoaned ? "Loaned to" : "Borrowed from"),
            Text("Destiny Ed ".ellipsis(), style: AppTheme.titleStyle(isBold: true),),
            const Text("on"),
            Text("28th Jan 2024", style: AppTheme.titleStyle(isBold: true),)
          ],
        ),
      ),
    );
  }
}