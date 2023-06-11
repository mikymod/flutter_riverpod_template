import 'package:flutter/material.dart';
import 'package:{{project_name}}/data/the_one_api/the_one_api.dart';

class CharacterDetailsView extends StatelessWidget {
  const CharacterDetailsView({
    required this.character,
    super.key,
  });
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name'),
                  Text('Height'),
                  Text('Race'),
                  Text('Gender'),
                  Text('Birth'),
                  Text('Spouse'),
                  Text('Death'),
                  Text('Realm'),
                  Text('Hair'),
                ],
              ),
              const VerticalDivider(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(character.name),
                  Text('${character.height}'),
                  Text('${character.race}'),
                  Text('${character.gender}'),
                  Text('${character.birth}'),
                  Text('${character.spouse}'),
                  Text('${character.death}'),
                  Text('${character.realm}'),
                  Text('${character.hair}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
