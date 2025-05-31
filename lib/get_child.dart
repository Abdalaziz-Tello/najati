import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najati_test/custom_widget.dart';
import 'package:najati_test/main.dart';
import 'package:najati_test/models/charachter_model.dart';
import 'package:najati_test/services/api/charachter.dart';
import 'package:najati_test/stack.dart';

import 'core/constants/image_manager.dart';
import 'core/error/exceptions.dart';
import 'features/children/presentation/bloc/children_bloc.dart';
import 'models/child/get_children_response.dart';
import 'services/api/children.dart';

class GetChildren extends StatefulWidget {
  const GetChildren({super.key});

  @override
  State<GetChildren> createState() => _GetChildrenState();
}

class _GetChildrenState extends State<GetChildren> {
  bool displayCharachter = false;
  bool isLoading = true;
  String? errorMessage;
  GetChildrenResponse? childrenResponse;
  GetCharacters? charachterResponse;
  int num = 0;
  @override
  void initState() {
    super.initState();
    fetchChildren();
    fetchCharachter();
  }

  Future<GetCharacters?> fetchCharachter() async {
    final resulti;
    try {
      CharacterServiceImp serviceImp = CharacterServiceImp(dio: Dio());
      resulti = await serviceImp.getCharachters();
      setState(() {
        charachterResponse = resulti;
      });
    } catch (e) {
      print("chrachter error ");
    }

    return charachterResponse;
  }

  Future<bool> createCharachter() async {
    final resulti;

    CharacterServiceImp serviceImp = CharacterServiceImp(dio: Dio());
    resulti = await serviceImp.createCharachter(num: num);

    return resulti;
  }

  Future<void> fetchChildren() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      ChildrenServiceImp serviceImp = ChildrenServiceImp(dio: Dio());
      final result = await serviceImp.getChildren();
      setState(() {
        childrenResponse = result;
      });
    } catch (e) {
      setState(() {
        errorMessage =
            e is ServerException
                ? e.message
                : 'حدث خطأ أثناء جلب بيانات الأطفال';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopRightCircle(),
          LeftBottomCircle(),
          RightBottomCircle(),

          // Main content
          Positioned(
            right: 5,
            top: screenH * 0.14,
            bottom: 20,
            left: 5,
            child:
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : errorMessage != null
                    ? Center(
                      child: Text(
                        errorMessage!,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                    : _buildMainContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("تسجيل الدخول", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: screenH * 0.05),
          Image.asset(
            'assets/images/Boos.png',
            height: screenH * 0.12,
            fit: BoxFit.contain,
          ),
          SizedBox(height: screenH * 0.04),
          SizedBox(
            height: screenH * 0.4,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: childrenResponse!.data.length,
              itemBuilder: (context, index) {
                final child = childrenResponse!.data[index];

                return InkWell(
                  onTap: () {
                    setState(() {
                      displayCharachter = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: screenW * 0.88,
                      height: screenH * 0.1,
                      //  color: Color.fromARGB(115, 0, 0, 0),
                      decoration: BoxDecoration(
                        //  color: Color(0x73C2CEE3).withOpacity(0.45),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1),
                        boxShadow: [
                          // BoxShadow(
                          //   blurRadius: 18,
                          //    color: Color(0x73C2CEE3).withOpacity(0.45),
                          // ),
                        ],
                      ),

                      // child: ListTile(
                      //   leading: CircleAvatar(
                      //     backgroundImage: NetworkImage(child.image),
                      //     radius: 30,
                      //     backgroundColor: Colors.grey[200],
                      //   ),
                      //   title: Text(
                      //     child.name,
                      //     style: TextStyle(fontWeight: FontWeight.bold),
                      //     textAlign: TextAlign.right,
                      //   ),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            //   padding: const EdgeInsets.all(16),
                            Card(
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(child.name),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              ImageManager.noImage,
                              height: screenH * 0.15,
                              width: screenW * 0.09,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          if (displayCharachter)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenW * 0.1,
                    vertical: 13,
                  ),
                  child: Text(
                    "اختر شخصيتك المفضلة",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                StackList(name: false, charachters: charachterResponse),
              ],
            ),
        ],
      ),
    );
  }
}




//   @override
//   Widget build(BuildContext context) {

//     return BlocProvider<ChildrenBloc>(
//       create: (context) => sl()..add(GetChildrenEvent()),

//       child: Builder(
//         builder: (context) {
//           return Scaffold(
//             body: Stack(
//               children: [
//                 TopRightCircle(),
//                 LeftBottomCircle(),
//                 RightBottomCircle(),
//                 Positioned(
//                   right: 5,
//                   top: screenH * 0.14,
//                   bottom: 20,
//                   left: 5,
//                   child: Column(
//                     children: [
//                       const Text(
//                         "تسجيل الدخول",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: screenH * 0.08),
//                       Image.asset(
//                         'assets/images/Boos.png',
//                         height: screenH * 0.12,
//                         fit: BoxFit.contain,
//                       ),
//                       SizedBox(height: screenH * 0.04),
          
//                       BlocBuilder<ChildrenBloc, ChildrenState>(
//                         builder: (context, state) {
//                           if (state is ChildrenLoading) {
//                             return const Center(child: CircularProgressIndicator());
//                           } else if (state is ChildrenError) {
//                             return Text(state.message);
//                           } else if (state is ChildrenLoaded) {
//                             final children = state.children.data;
          
//                             return Expanded(
//                               child: ListView.separated(
//                                 itemCount: children.length,
//                                 separatorBuilder: (_, __) => SizedBox(height: screenH * 0.02),
//                                 itemBuilder: (context, index) {
//                                   final child = children[index];
//                                   return InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         displayCharacter = true;
//                                       });
//                                     },
//                                     child: Container(
//                                       width: screenW * 0.88,
//                                       height: screenH * 0.1,
//                                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                                       decoration: BoxDecoration(
//                                         color: const Color(0x73C2CEE3).withOpacity(0.45),
//                                         borderRadius: BorderRadius.circular(12),
//                                         border: Border.all(color: Colors.white, width: 1),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             blurRadius: 18,
//                                             color: const Color(0x73C2CEE3).withOpacity(0.45),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           Text(
//                                             child.name,
//                                             style: const TextStyle(fontSize: 18, color: Colors.black),
//                                           ),
//                                           const SizedBox(width: 10),
//                                           ClipRRect(
//                                             borderRadius: BorderRadius.circular(8),
//                                             child: child.image != null && child.image!.isNotEmpty
//                                                 ? Image.network(
//                                                     child.image!,
//                                                     height: screenH * 0.08,
//                                                     width: screenW * 0.1,
//                                                     fit: BoxFit.cover,
//                                                     errorBuilder: (_, __, ___) => Image.asset(
//                                                       ImageManager.noImage,
//                                                       height: screenH * 0.08,
//                                                       width: screenW * 0.1,
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                   )
//                                                 : Image.asset(
//                                                     ImageManager.noImage,
//                                                     height: screenH * 0.08,
//                                                     width: screenW * 0.1,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           } else {
//                             return const SizedBox();
//                           }
//                         },
//                       ),
          
//                       if (displayCharacter)
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: screenW * 0.1,
//                                   vertical: 12,
//                                 ),
//                                 child: const Text(
//                                   "اختر شخصيتك المفضلة",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               const StackList(), // Character selection widget
//                             ],
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       ),
//     );
//   }
// }
