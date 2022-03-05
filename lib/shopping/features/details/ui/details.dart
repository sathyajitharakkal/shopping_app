import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layered_arc/app_page_injectable.dart';
import 'package:layered_arc/app_theme.dart';
import 'package:layered_arc/shopping/features/details/bloc/details_cubit.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int count = 1;
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Details",
                  style: AppTheme.of(context).header2,
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<DetailsCubit, DetailsState>(
                builder: (context, state) {
              if (state is DetailsInitial) {
                String imagePath = "https://admin.maaxkart.com/" +
                    state.productResponse.image!.replaceAll(r'\', "");
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imagePath,
                            width: width * 0.9,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            state.productResponse.proName.toString(),
                            style: AppTheme.of(context)
                                .text1
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            state.productResponse.company.toString(),
                            style: AppTheme.of(context).text2,
                          ),
                          Text("Qty : " + state.productResponse.attribute.toString()),
                          Text("MRP : " + state.productResponse.price.toString(),
                              style: AppTheme.of(context).text3.copyWith(
                                  decoration: TextDecoration.lineThrough)),
                          Text(
                            "Offer Price : " + state.productResponse.sellingPrice.toString(),
                            style: AppTheme.of(context).header4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Amount : "+(int.parse(state.productResponse.sellingPrice.toString()) * count).toString(),
                                style: AppTheme.of(context).header2,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: (){if(count > 1){setState(() {
                                        count--;
                                      });}},
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text("-",
                                            style: AppTheme.of(context)
                                                .header1
                                                .copyWith(fontSize: 24)),
                                      )),
                                  Text(count.toString()),
                                  GestureDetector(
                                      onTap: (){setState(() {
                                        count++;
                                      });},
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text("+",
                                            style: AppTheme.of(context).header1),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ]),
                  ),
                );
              } else {
                return const Center(child: Text("No Data available"));
              }
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                  color: Colors.white,
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    child:
                        Text("Buy Now", style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                    color: Colors.green),
              )),
            ],
          ),
        ],
      )),
    );
  }
}
