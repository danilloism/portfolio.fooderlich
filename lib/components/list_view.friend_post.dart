import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/utils.dart';

class FriendPostListView extends StatelessWidget {
  const FriendPostListView({
    Key? key,
    required this.friendPosts,
  }) : super(key: key);

  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs',
            style: Theme.of(context).textTheme.headline1,
          ),
          Gap.h16,
          ListView.separated(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => FriendPostTile(
              post: friendPosts[index],
            ),
            separatorBuilder: (_, __) => Gap.h16,
            itemCount: friendPosts.length,
          ),
          Gap.h16,
        ],
      ),
    );
  }
}
