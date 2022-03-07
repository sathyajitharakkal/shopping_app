import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layered_arc/app_theme.dart';
import 'package:layered_arc/shopping/features/home/bloc/home_cubit.dart';
import 'package:layered_arc/shopping/models/movies_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Home",
                  style: AppTheme.of(context).header2,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Search Item',
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){
                        BlocProvider.of<HomeCubit>(context).getProductDetails(value: searchController.text);
                      }, icon: const Icon(Icons.search))
                    ],
                  ),
          ),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded) {
                return showMoviesList(state.productResponse);
              } else if (state is HomeError) {
                return const Center(child: Text("error loading Data"));
              } else {
                return const Center(child: Text("No Data available"));
              }
            }),
          ),
        ],
      )),
    );
  }
}

Widget showMoviesList(List<ProductResponse> productResponse) {
  return ListView.builder(
      itemCount: productResponse.length,
      itemBuilder: (context, index) {
        String imagePath = "https://admin.maaxkart.com/" +
            productResponse[index].image!.replaceAll(r'\', "");
        return GestureDetector(
            onTap: () {
              BlocProvider.of<HomeCubit>(context)
                  .openDetails(context, productResponse[index]);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              imagePath,
                              height: 50,
                              width: 50,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productResponse[index].proName ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.of(context)
                                        .text1
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Text("Qty : " +
                                      productResponse[index]
                                          .attribute
                                          .toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Offer Price : " +
                                productResponse[index].sellingPrice.toString(),
                            style: AppTheme.of(context).header4,
                          ),
                          Text(
                              "MRP : " +
                                  productResponse[index].price.toString(),
                              style: AppTheme.of(context).text3.copyWith(
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      });
}
