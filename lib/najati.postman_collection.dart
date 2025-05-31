
// class  FeatchProjectBloc extends Bloc<FeatchProjectEvent, FeatchProjectState> {
//   FeatchProjectBloc() : super(FeatchProjectInitialState()) {
 

//     on<FeatchProject>(
//       (event, emit) async {
//         print("kjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//         // ! We Can Find The attribute of Event in the 'event' object 
//         ResultModel result = await FeatchProjectSerivceImp().featchProject();
//         print("this is result is from project service ================================");
//         print(result);
//         if (result is ProjectInformationModelForFetchProject) {
//           emit((SuccessFeatchProjectState(featchedProject: result)));
          
//         } else {
//           emit(ErrorFetchProjectState(message: result.runtimeType.toString()));
//         }
//       },
//     );
//   }
// }

//   return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//             create: (context) => FeatchTasksBloc()..add(FeatchTasks())),
//         BlocProvider(
//           create: (context) => FeatchProjectBloc()..add(FeatchProject()),
//         )
//       ],

//////////////////////////////////////////


//  context.read<CreateProjectBloc>().add(CreateProject(
//                                       project: ProjectModel(
//                                           projectName: projectName.text,
//                                           projectDescription: projectScript.text,
//                                           projectStatus: "NEW")));
                      



//            Spacer(),
//                   BlocConsumer<CreateProjectBloc, CreateProjectState>(

//    listener: (context, state) {
//                 if (state is SuccessCreateProjectState) {


                  
// Navigator.push(context,MaterialPageRoute( builder: (context) => MyTasks(state.id),
//                               ),);       }
//               },



//                     builder: (context, state) {
//                            if (state is CreateProjectInitialState) {
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 20.0),
//                         child: Center(
//                           child: Container(
//                               width: width / 1.1,
//                               height: height / 12,
//                               child: ElevatedButton(
//                                 onPressed: () async {
//                                   context.read<CreateProjectBloc>().add(CreateProject(
//                                       project: ProjectModel(
//                                           projectName: projectName.text,
//                                           projectDescription: projectScript.text,
//                                           projectStatus: "NEW")));
//                                 },




//    return BlocProvider(
//       create: (context) => CreateProjectBloc(),
//       child: Builder(builder: (context) {
//         return Scaffold(




