import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class SkeletonTransDetail extends StatefulWidget {
  const SkeletonTransDetail({Key? key}) : super(key: key);

  @override
  _SkeletonTransDetailState createState() => _SkeletonTransDetailState();
}

class _SkeletonTransDetailState extends State<SkeletonTransDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child:  SizedBox(
        width: double.infinity,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade200,
          child: box(),
        ),
      ),
    );
  }

  Widget box() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 260,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Colors.grey[300]),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          height: 13,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Colors.grey[300]),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 58,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey[300]),
            ),
            Container(
              height: 58,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey[300]),
            ),
            Container(
              height: 58,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey[300]),
            ),
            Container(
              height: 58,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey[300]),
            ),
          ],
        )
      ],
    );
  }
}
