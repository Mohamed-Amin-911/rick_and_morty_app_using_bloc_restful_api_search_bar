import 'package:flutter/material.dart';
import 'package:rick_and_morty_app_using_bloc/constants/colors.dart';
import 'package:rick_and_morty_app_using_bloc/data/models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.character});
  final Character character;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      leading: const BackButton(
        color: MyColors.yellow,
      ),
      expandedHeight: 600,
      floating: true,
      pinned: true,
      centerTitle: true,
      forceMaterialTransparency: true,
      snap: true,
      stretch: true,
      backgroundColor: MyColors.brown,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Container(
          padding: const EdgeInsets.only(left: 30),
          decoration: const BoxDecoration(
              color: MyColors.yellow,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30))),
          width: double.infinity,
          child: Text(
            character.name,
            style: const TextStyle(
                color: MyColors.brown,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.lightBrown,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.yellow,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.lightBrown,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.brown,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('Actor/Actress : ', character.name),
                  buildDivider(235),
                  characterInfo('Appeared in : ', character.episode.join(', ')),
                  buildDivider(250),
                  characterInfo('Status : ', character.status),
                  buildDivider(300),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 570,
            )
          ])),
        ],
      ),
    );
  }
}
