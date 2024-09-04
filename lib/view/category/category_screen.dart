import 'package:firebase_login_project/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/gym_list_by_category_bloc/gym_list_by_category_bloc.dart';
import '../../bloc/gym_list_by_category_bloc/gym_list_by_category_event.dart';
import '../../bloc/gym_list_by_category_bloc/gym_list_by_category_state.dart';
import '../../models/gym_list_by_category_model.dart';

class CategoryScreen extends StatefulWidget {
  final int id;
  final String name;
  const CategoryScreen({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryListData>? categories = [];
  List<CategoryListData>? finalCategories = [];
  List<String> categoriesListData = [];
  bool isEnable = false;

  @override
  void initState() {
    Map<String, dynamic> categoryIdData = {"category_id": "${widget.id}"};
    context.read<GymListByCategoryBloc>().add(
          GymListByCategoryDetails(body: categoryIdData),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
        title: TextWidget(
          fontSize: 15,
          text: widget.name,
          color: Colors.red,
        ),
      ),
      body: BlocBuilder<GymListByCategoryBloc, GymListByCategoryState>(
          builder: (context, state) {
        if (state is GymListByCategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GymListByCategorySuccess) {
          return ListView.builder(
              itemCount: state.gymListByCategoryModel.data?.length,
              itemBuilder: (context, index) {
                if (state.gymListByCategoryModel.data?[index].categories !=
                        null &&
                    state.gymListByCategoryModel.data?[index].categories !=
                        []) {
                  categories =
                      state.gymListByCategoryModel.data?[index].categories ??
                          [];
                  categories!.toSet();
                } else {
                  categories = [];
                }

                return Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  //height: 200,
                  decoration: BoxDecoration(
                      color: const Color(0xfff292929),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              'https://gymwise.in/uploads/gym/${state.gymListByCategoryModel.data?[index].gymLogo ?? ''}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextWidget(
                                  text: state.gymListByCategoryModel
                                          .data?[index].gymName ??
                                      '',
                                  overFlow: TextOverflow.ellipsis,
                                  //text: 'TTN Gym',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 45,
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: state.gymListByCategoryModel
                                                .data?[index].address ??
                                            '',
                                        fontSize: 12,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.watch_later_rounded),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextWidget(
                                    text: state.gymListByCategoryModel
                                            .data?[index].open ??
                                        '',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextWidget(
                                    text:
                                        '${state.gymListByCategoryModel.data?[index].rating}',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 35,
                        child: ListView.builder(
                            itemCount: categories!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                margin: const EdgeInsets.only(right: 15),
                                alignment: Alignment.center,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: const Color(0xfff4f4f4f),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextWidget(
                                  text: categories![index].categoryName ?? '',
                                  // text: "Aerobic exercise",
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              });
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
