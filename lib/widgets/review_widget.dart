import 'package:flutter/material.dart';
import 'package:indicart/model/review_model.dart';
import 'package:indicart/utils/constants.dart';
import 'package:indicart/utils/utils.dart';
import 'package:indicart/widgets/rating_star_widget.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.senderName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: screenSize.width / 4,
                    child: FittedBox(
                      child: RatingStatWidget(
                        rating: review.rating,
                      ),
                    ),
                  ),
                ),
                Text(
                  keysOfRating[review.rating - 1],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Text(
            review.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
