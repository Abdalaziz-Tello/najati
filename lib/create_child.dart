import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najati_test/core/constants/image_manager.dart';
import 'package:najati_test/custom_widget.dart';
import 'package:najati_test/main.dart';
import 'package:intl/intl.dart';
import 'package:najati_test/get_child.dart';
import 'package:najati_test/verify.dart';

import 'error/exceptions.dart';
import 'features/children/presentation/bloc/children_bloc.dart';
import 'models/child/create_child_response.dart';
import 'services/api/children.dart';

class CreateChild extends StatefulWidget {
  CreateChild({super.key});
  @override
  State<CreateChild> createState() => _CreateChildState();
}

class _CreateChildState extends State<CreateChild> {
  DateTime? selectedDate;
  String? selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopRightCircle(),
          LeftBottomCircle(),
          RightBottomCircle(),
          Positioned(
            right: 5,
            top: screenH * 0.12,
            bottom: 20,
            left: 5,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: screenH * 0.1),
                  Text(
                    "تسجيل الدخول",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenH * 0.1),
                  Container(
                    width: screenW * 0.9,
                    height: screenH * 0.63,
                    decoration: BoxDecoration(
                      color: Color(0x73C2CEE3).withOpacity(0.45),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 18,
                          color: Color(0x73C2CEE3).withOpacity(0.45),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Boo image
                            Image.asset(
                              'assets/images/Boo.png',
                              height: screenH * 0.12,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: screenH * 0.03),
                            // First TextFormField with label
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "اسم الطفل",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: screenH * 0.016),
                            TextFormField(
                              controller: nameController,
                              //  textDirection: TextDirection.rtl,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                filled: true,
                                fillColor: Colors.transparent,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: screenH * 0.016),
                            // Second TextFormField with label (Date of Birth)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "تاريخ الميلاد",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: screenH * 0.016),
                            TextFormField(
                              readOnly: true,
                              controller: TextEditingController(
                                text:
                                    selectedDate != null
                                        ? DateFormat(
                                          'yyyy-MM-dd',
                                        ).format(selectedDate!)
                                        : '',
                              ),
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                filled: true,
                                fillColor: Colors.transparent,
                                prefixIcon: IconButton(
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: Colors.black,
                                  ),
                                  onPressed: () => _selectDate(context),
                                ),
                              ),
                            ),
                            SizedBox(height: screenH * 0.03),
                            // Third TextFormField with label (Gender)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "الجنس",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: screenH * 0.016),
                            TextFormField(
                              textAlign: TextAlign.right,
                              readOnly: true,
                              controller: TextEditingController(
                                text: selectedGender ?? '',
                              ),
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                filled: true,
                                fillColor: Colors.transparent,
                                prefixIcon: PopupMenuButton<String>(
                                  color: Color(0xFFE6EFFF),
                                  constraints: BoxConstraints(
                                    //        minWidth: 150, // Set popup width
                                    minWidth: 0.85 * screenW,
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                  onSelected: (String value) {
                                    setState(() {
                                      selectedGender = value;
                                    });
                                  },
                                  itemBuilder:
                                      (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'ذكر',
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text('ذكر'),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'انثى',
                                          child: Align(
                                            alignment: Alignment.topRight,

                                            child: Text('انثى'),
                                          ),
                                        ),
                                      ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenH * 0.04),
                  SizedBox(
                    width: screenW * 0.8,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (nameController.text.isEmpty ||
                            selectedGender == null ||
                            selectedDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("يرجى ملء جميع الحقول")),
                          );
                          return;
                        }
                        ChildrenServiceImp serviceImp = ChildrenServiceImp(
                          dio: Dio(),
                        );

                        try {
                          final model = await serviceImp.createChild(
                            name: nameController.text,
                            gender:
                                (selectedGender == "ذكر")
                                    ? selectedGender = "M"
                                    : selectedGender = "F"!,
                            birthDate: DateFormat(
                              'yyyy-MM-dd',
                            ).format(selectedDate!),
                            imagePath: ImageManager.active,
                          );
                          log("hiiiiii");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetChildren(),
                            ),
                          );
                        } catch (e) {
                          // You can customize the message if it's a ServerException
                          final errorMessage =
                              e is ServerException
                                  ? e.message
                                  : 'حدث خطأ أثناء إنشاء حساب الطفل، يرجى المحاولة لاحقًا';

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }

                        // context.read<ChildrenBloc>().add(CreateChildEvent(
                        //  // ));

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute( name: nameController.text,
                        //   gender: selectedGender!,
                        //   birthDate: DateFormat('yyyy-MM-dd').format(selectedDate!),
                        //   imagePath: 'path/to/image.jpg',

                        //     builder: (context) => GetChildren(),
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("التالي"),
                    ),
                  ),
                  SizedBox(height: screenH * 0.04),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget _buildForm(BuildContext context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Text("تسجيل الدخول", style: TextStyle(fontWeight: FontWeight.bold)),
//       SizedBox(height: screenH * 0.1),
//       _buildChildFormCard(context),
//       SizedBox(height: screenH * 0.04),
//       SizedBox(
//         width: screenW * 0.8,
//         child: ElevatedButton(
//           onPressed: () {
//             if (nameController.text.isEmpty ||
//                 selectedGender == null ||
//                 selectedDate == null) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("يرجى ملء جميع الحقول")),
//               );
//               return;
//             }

//             context.read<ChildrenBloc>().add(CreateChildEvent(
//               name: nameController.text,
//               gender: selectedGender!,
//               birthDate: DateFormat('yyyy-MM-dd').format(selectedDate!),
//               imagePath: 'path/to/image.jpg', // TODO: Connect to image picker
//             ));
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.purple,
//             foregroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           child: Text("التالي"),
//         ),
//       ),
//     ],
//   );
// }

// BlocConsumer<ChildrenBloc, ChildrenState>(
//   listener: (context, state) {
//     if (state is ChildrenLoading) {
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (_) => Center(child: CircularProgressIndicator()),
//       );
//     } else {
//       // Hide loading if it was showing
//       Navigator.of(context, rootNavigator: true).pop();
//     }

//     if (state is ChildCreated) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("تم إنشاء الطفل بنجاح")),
//       );

//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => GetChildren()),
//       );
//     }

//     if (state is ChildrenError) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(state.message)),
//       );
//     }
//   },
//   builder: (context, state) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           TopRightCircle(),
//           LeftBottomCircle(),
//           RightBottomCircle(),
//           Positioned(
//             right: 5,
//             top: screenH * 0.12,
//             bottom: 20,
//             left: 5,
//             child: SingleChildScrollView(
//               child: _buildForm(context), // Extracted form builder
//             ),
//           ),
//         ],
//       ),
//     );
//   },
// )
