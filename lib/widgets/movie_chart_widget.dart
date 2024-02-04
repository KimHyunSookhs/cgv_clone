import 'package:flutter/material.dart';
import 'package:cgv_clone/models/movie.dart';
import 'package:cgv_clone/screens/movie/detail_screen.dart';

class MovieChartWidget extends StatelessWidget {
  const MovieChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildRankPoster(Movie movie) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(5, 5),
                  blurRadius: 4.0,
                ),
              ]),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      movie.imageUrl,
                      fit: BoxFit.contain,
                      width: 130.0,
                    ),
                  ),
                  Positioned(
                      left: 2.0,
                      bottom: -8.0,
                      child: Text(
                        movie.rank.toString(),
                        style: TextStyle(
                            fontSize: 50.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black54,
                                offset: Offset(2, 2),
                                blurRadius: 4.0,
                              )
                            ]),
                      ))
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              movie.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "현재 예매율${movie.rating}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            )
          ],
        ));
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "무비차트",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "전체보기",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 10.0,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 280.0,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  movieList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(thisMovie: movieList[index])),
                      );
                    },
                    child: buildRankPoster(movieList[index]),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
