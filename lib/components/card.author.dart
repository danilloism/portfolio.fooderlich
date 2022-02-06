import 'package:flutter/material.dart';
import 'package:fooderlich/components/circle_image.dart';
import 'package:fooderlich/theme.dart';
import 'package:fooderlich/utils.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              Gap.w8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.light.textTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.light.textTheme.headline3,
                  )
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border,
                color: _isFavorited ? Colors.red[400] : Colors.green),
            iconSize: 30,
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              maxWidth: 30,
            ),
            onPressed: () {
              setState(
                () => _isFavorited = !_isFavorited,
              );
            },
          ),
        ],
      ),
    );
  }
}
