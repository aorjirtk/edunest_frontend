



import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:my_flutter_app/config/extension.dart';
import 'package:my_flutter_app/directory/utils/app_logger.dart';
import 'package:my_flutter_app/directory/utils/pick_file.dart';
import 'package:my_flutter_app/directory/widgets/custom_button.dart';
import 'package:my_flutter_app/directory/widgets/date_picker.dart';
import 'package:my_flutter_app/enums/enums.dart';
import 'package:my_flutter_app/styles/colors.dart';
import 'package:my_flutter_app/styles/theme.dart';

class AddLoanScreen extends StatefulWidget {
  const AddLoanScreen({super.key});

  @override
  State<AddLoanScreen> createState() => _AddLoanScreenState();
}

class _AddLoanScreenState extends State<AddLoanScreen> {
  Currency? currency;
  final currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "School Informations",
                  style: AppTheme.headerStyle(),
                ),
                8.height(),
                CustomTextField(TextEditingController(), hint: 'High Institution',password: false, border: Border.all(color: greyColor),
                ),
                 8.height(),
                CustomTextField(TextEditingController(), hint: 'Course',password: false, border: Border.all(color: greyColor),
                ),
                 8.height(),
                CustomTextField(TextEditingController(), hint: 'Student ID Number',password: false, border: Border.all(color: greyColor),
                ),
                20.height(),
                Text(
                  "Loan Type",
                  style: AppTheme.headerStyle(),
                ),
                    
                ...List.generate(LoanType.values.length, (index) {
                  final type = LoanType.values[index];
                    
                  final loanText = type == LoanType.LoanGivenByMe? 'Others?': 'Student loan?';
                  return RadioListTile(value: type, 
                  contentPadding: const EdgeInsets.all(0),
                  groupValue: LoanType.values[index], 
                  activeColor: primaryColor,
                  title: Text(loanText),
                  onChanged: (value){},
                   );
                    
                    
                    
                }
                ),
                20.height(),
                Text(
                  "Upload Document (Admission Letter)",
                  style: AppTheme.headerStyle(),
                ),
                8.height(),
                    
                Row(
                  children: [
                    TextButton(onPressed: (){
                        pickDocument().then((value){
                          if (value != null){
                            
                            // upload to server
                          }
                        }
                        );
                    },
                    child: Text('Upload Admission Letter (pdf, image)',
                    style: AppTheme.titleStyle(Color: primaryColor),
                    ),
                    ),
                    const Spacer(),
                    
                    const Icon(Icons.check_circle,
                    color: greenColor,
                    ),
                  ],
                ),
                    
                  20.height(),
                  Row(
                    children: [
                      Text("Loan Amount", style: AppTheme.headerStyle(),
                      ),
                    
                      const Spacer(),
                      Text("Loan Currency", style: AppTheme.headerStyle(),
                      ),
                    ],
                  ),
                  8.height(),
                  Row(
                    children: [
                      Expanded(child:  CustomTextField(TextEditingController(), hint: 'Loan Amount',
                      keyboardType: TextInputType.number,
                      password: false, border: Border.all(color: greyColor),
                ),
                ),
                30.width(),
                    
                Expanded(
                  child: 
                GestureDetector(
                    
                  onTap: (){
                    showCurrencyPicker(context: context, 
                    onSelect: (Currency value){
                      currency = value;
                      setState(() {}
                      ); 
                    },
                    showCurrencyCode: true,
                    showCurrencyName: true,
                    );
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyColor),
                    ),
                    child:  Text(currency == null?"Currency": "${currency!.code} - ${currency!.symbol}")
                    ),
                )
                ),
                    ],
                  ),

                  20.height(),
                  Row(
                    children: [
                      Text("Admission Date",
                      style: AppTheme.headerStyle(),
                      ),
                      const Spacer(),
                      Text("Loan Application Date",
                      style: AppTheme.headerStyle(),
                      ),
                    ],
                  ),

                  8.height(),

                  Row(
                    children: [
                      Expanded(child: 
                      CustomTextField(TextEditingController(),
                      hint: "admission Date",
                      keyboardType: TextInputType.number,
                      password: false,
                       readOnly: true,
                       onTap: () async{
                        final date = await pickDate(context,
                        firstDate: DateTime(currentDate.year - 1), secondDate: currentDate);
                      if(date != null){
                        appLogger(date);
                       }
                      },
                      border: Border.all(color: greyColor),
                      )
                      ),

                      30.width(),
                       Expanded(child: 
                      CustomTextField(TextEditingController(),
                      hint: "loan application Date",
                      
                      keyboardType: TextInputType.number,
                      password: false,
                      readOnly: true,
                      onTap: () async{
                        final date = await pickDate(context,
                        firstDate: DateTime(currentDate.year - 1), secondDate: currentDate);
                      if(date != null){
                        appLogger(date);
                       }
                      },
                   
                      border: Border.all(color: greyColor),
                      )
                      ),            
                    ],
                  ),
                  20.height(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("creditor's details", style: AppTheme.headerStyle(),
                          ),
                          10.height(),
                            Text("Full Name", style: AppTheme.headerStyle(),
                          ),
                            8.height(),
                             CustomTextField(TextEditingController(), 
                              hint: 'Full Name',
                              keyboardType: TextInputType.number,
                              password: false, 
                              border: Border.all(color: greyColor),
                      ),
                      8.height(),
                            Text("Phone Number", style: AppTheme.headerStyle(),
                          ),

                          8.height(),
                          CustomTextField(TextEditingController(), 
                              hint: 'Phone Number',
                              keyboardType: TextInputType.number,
                              password: false, 
                              border: Border.all(color: greyColor),
                      ),
                      8.height(),
                            Text("Email", style: AppTheme.headerStyle(),
                          ),

                          8.height(),
                          CustomTextField(TextEditingController(), 
                              hint: "Email",
                              keyboardType: TextInputType.number,
                              password: false, 
                              border: Border.all(color: greyColor),
                      ),
                      8.height(),
                            Text("Guarantor's Name", style: AppTheme.headerStyle(),
                          ),

                          8.height(),
                          CustomTextField(TextEditingController(), 
                              hint: "Guarantor's Name",
                              keyboardType: TextInputType.number,
                              password: false, 
                              border: Border.all(color: greyColor),
                      ),
                      8.height(),
                            Text("Guarantor's Phone Number", style: AppTheme.headerStyle(),
                          ),

                          8.height(),
                          CustomTextField(TextEditingController(), 
                              hint: "Guarantor's Phone Number",
                              keyboardType: TextInputType.number,
                              password: false, 
                              border: Border.all(color: greyColor),
                      ),
                      20.height(),
                Text(
                  "Upload Document (Guarantor Form)",
                  style: AppTheme.headerStyle(),
                ),
                8.height(),
                    
                Row(
                  children: [
                    TextButton(onPressed: (){
                        pickDocument().then((value){
                          if (value != null){
                            
                            // upload to server
                          }
                        }
                        );
                    },
                    child: Text('Upload Guarantor Form (pdf, image)',
                    style: AppTheme.titleStyle(Color: primaryColor),
                    ),
                    ),                    
                    const Spacer(),
                    const Icon(Icons.check_circle,
                    color: greenColor,
                    ),
                  ],
                ),

                      40.height(),

                      CustomButton(onPressed: (){}, text: "Send Request",
                      
                      ),
                      40.height(),
                      ],
                  )                
              ],
            ),
          ),
        ),
      ),
    );
  }
}