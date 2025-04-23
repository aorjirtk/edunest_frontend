

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/config/extension.dart';
import 'package:my_flutter_app/screen/loan_dashboard/local_widgets/loan_info_card.dart';
import 'package:my_flutter_app/styles/colors.dart';
import 'package:my_flutter_app/styles/theme.dart';

class LoanDashboardScreen extends StatefulWidget {
  const LoanDashboardScreen({super.key});

  @override
  State<LoanDashboardScreen> createState() => _LoanDashboardScreenState();
}

class _LoanDashboardScreenState extends State<LoanDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan', style: AppTheme.headerStyle(),
        ),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.exit_to_app)),
        IconButton(onPressed: (){
          context.push('/search_loan');
        }, icon: const Icon(Icons.search))
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: greyColor)),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text(
                                    "Total  Loaned",
                                    style: AppTheme.headerStyle(),
                                  ) 
                                  ),
                                  const Icon(
                                    Icons.outbond,
                                    color: redColor,
                                  )
                                ],
                              ),
                              
                              
                              Text('\$ 45,000', style: AppTheme.titleStyle(),
                              
                              ),
          
                              const Divider(),
                                Row(
                                children: [
                                  Expanded(child: Text(
                                    "Total  Owed",
                                    style: AppTheme.headerStyle(),
                                  ) 
                                  ),
                                  const Icon(
                                    Icons.outbond,
                                    color: greenColor,
                                  )
                                ],
                              ),
                              
                              
                              Text('\$ 45,000', style: AppTheme.titleStyle(),
                              
                              ),
                      
                            ],
                                            
                          ),
                        ),
          
                        const VerticalDivider(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Toatal Balance',
                            style: AppTheme.headerStyle(),
                            ),
                            Text('\$ 45,000',
                            style: AppTheme.titleStyle(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                30.height(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pending Loan',
                    style: AppTheme.headerStyle(),
                    ),
          
                    15.height(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(10, (index){
                        return LoanInfoCard( isLoaned: index % 2 == 0? true: false, onTap: (){
                          context.push('/view_loan');
                        },);
                        
                        }
                        ),
                      ),
                    )
                  ],
                ),
                30.height(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Completed Loan',
                    style: AppTheme.headerStyle(),
                    ),
          
                    15.height(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(10, (index){
                        return LoanInfoCard( isLoaned: index % 2 == 0? true: false,onTap: (){
                          context.push('/view_loan');
                        },);
                        
                        }
                        ),
                      ),
                    )
                  ],
                ),
          
            ],
          ),
        ),
      ),

          floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: (){
            context.push('/add_loan');
          },
          child: const Icon(Icons.add),
      ),     
    );
  }
}