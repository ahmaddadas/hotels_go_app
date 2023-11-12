// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_test/model/hotel_model.dart';
import 'package:interview_test/utils/my_text.dart';
import 'package:interview_test/utils/theme.dart';

class HotelContainer extends StatelessWidget {
  final HotelModel hotel;
  const HotelContainer({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height / 4,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(myRadius(context)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: -10,
            blurRadius: size.width / 30,
            offset: const Offset(15, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height / 7,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(myRadius(context)),
                          topRight: Radius.circular(myRadius(context))),
                      image: DecorationImage(
                          image: NetworkImage(hotel.image), fit: BoxFit.cover)),
                ),
                Positioned(
                    top: size.width / 40,
                    left: size.width / 40,
                    child: Container(
                      height: size.height / 25,
                      width: size.width / 7,
                      decoration: BoxDecoration(
                          color: mySecondColor.withOpacity(0.7),
                          borderRadius:
                              BorderRadius.circular(myRadius(context) / 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: size.width / 25,
                          ),
                          SizedBox(
                            width: size.width / 100,
                          ),
                          MyText(
                              color: Colors.white,
                              text: hotel.starts.toString(),
                              fontSize: size.width / 25,
                              fontWeight: FontWeight.bold)
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(size.width / 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 1.7,
                      child: MyText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: myBlackColor,
                          text: hotel.name,
                          fontSize: size.width / 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Container(
                          height: size.height / 35,
                          width: size.width / 12,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(myRadius(context) / 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: size.width / 30,
                                offset: const Offset(15, 5),
                              ),
                            ],
                          ),
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/icons/map.svg',
                            color: mySecondColor,
                            height: size.height / 50,
                            width: size.width / 20,
                          )),
                        ),
                        SizedBox(
                          width: size.width / 80,
                        ),
                        SizedBox(
                          width: size.width / 2,
                          child: MyText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: myBlackColor,
                              text: hotel.address,
                              fontSize: size.width / 30,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText(
                        color: myBlackColor,
                        text: '${hotel.price} ${hotel.currency}',
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold),
                    MyText(
                        color: myBlackColor,
                        text: '${hotel.review} (${hotel.reviewScore})',
                        fontSize: size.width / 30,
                        fontWeight: FontWeight.normal)
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
