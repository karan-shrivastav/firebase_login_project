import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_project/bloc/category_bloc/category_state.dart';
import 'package:firebase_login_project/bloc/gym_bloc/gym_data_bloc.dart';
import 'package:firebase_login_project/bloc/gym_bloc/gym_data_state.dart';
import 'package:firebase_login_project/view/category/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../bloc/category_bloc/category_bloc.dart';
import '../../bloc/category_bloc/category_event.dart';
import '../../bloc/gym_bloc/gym_data_event.dart';
import '../../widgets/gym_category_widget.dart';
import '../../widgets/gym_comonent_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfield_widget.dart';

class HomeScreen extends StatefulWidget {
  final User? user;
  HomeScreen({this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }

  GoogleMapController? _controller;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(28.704060, 77.102493),
    zoom: 8,
  );

  @override
  void initState() {
   // _getCurrentLocation();
    Map<String, dynamic> gymData = {
      "latitude": "28.704060",
      "longitude": "77.102493"
    };
    context.read<GymDataBloc>().add(
          GymDataDetails(body: gymData),
        );
    Map<String, dynamic> categoryData = {"user_id": "0"};
    context.read<CategoryBloc>().add(
          CategoryDetails(body: categoryData),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                 TextfieldWidget(
                  hintText: '131, B Bloc, Sector2, Noida, Uttar Pradesh...',
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       _signOut();
                //       Navigator.of(context).pop();
                //       setState(() {});
                //     },
                //     child: const TextWidget(
                //       text: 'Signout',
                //     )),
                const SizedBox(
                  height: 20,
                ),
                const TextWidget(
                  text: 'FITNESS LOCATION FOR YOU',
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 170,
                  child: BlocBuilder<GymDataBloc, GymDataState>(
                      builder: (context, state) {
                    print(state);
                    if (state is GymDataSuccess) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.gymDataModel.data?.length,
                          itemBuilder: (context, index) {
                            return GymComonentWidget(
                              image:
                                  'https://gymwise.in/uploads/gym/${state.gymDataModel.data?[index].gymLogo}',
                              name: state.gymDataModel.data?[index].gymName,
                            );
                          });
                    }
                    return const SizedBox();
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextWidget(
                  text: 'ACTIVITIES FOR YOU',
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 115,
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                      builder: (context, state) {
                    print(state);
                    if (state is CategorySuccess) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.gymCategoryModel.data?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryScreen(
                                      id: state.gymCategoryModel.data?[index]
                                              .id ??
                                          0,
                                      name: state.gymCategoryModel.data?[index]
                                              .name ??
                                          '',
                                    ),
                                  ),
                                );
                              },
                              child: GymCategoryWidget(
                                image: state.gymCategoryModel.data?[index].icon,
                                name: state.gymCategoryModel.data?[index].name,
                              ),
                            );
                          });
                    }
                    return const SizedBox();
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextWidget(
                  text: 'AROUND YOU',
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _initialPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
