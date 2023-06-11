import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:os_flutter_project/data/the_one_api/the_one_api.dart';

class MovieDetailsView extends ConsumerWidget {
  const MovieDetailsView({
    required this.movie,
    super.key,
  });
  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  Text('Academy Nominations'),
                  Text('Academy Wins'),
                  Text('Revenue'),
                  Text('Budget'),
                ],
              ),
              const VerticalDivider(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.name),
                  Text(movie.academyAwardNominations.toString()),
                  Text(movie.academyAwardWins.toString()),
                  Text('${movie.boxOfficeRevenueInMillions} M'),
                  Text('${movie.budgetInMillions} M'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
