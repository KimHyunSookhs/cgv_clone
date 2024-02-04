

class Movie {
  final int rank;
  final String rating;
  final String title;
  final String subTitle;
  final String imageUrl;
  final String runTime;

  Movie({
    required this.rank,
    required this.rating,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.runTime,
  });
}

List<Movie> movieList = [
  movieinfo(1,'59.5%','공조2-인터내셔날', '공조 이즈 백!','assets/poster_01.jpg','2시간 9분'),
  movieinfo(2,'8.7%','알라딘', '신비의 아그라바왕국의 시대','assets/poster_02.jpg','2시간 8분'),
  movieinfo(3,'7.8%','육사오', '남북 군인들간의 코믹 접선극','assets/poster_03.jpg','1시간 53분'),
  movieinfo(4,'5.2%','탑건-매버릭', '가장 압도적인 비행이 시작된다!','assets/poster_04.jpg','2시간 10분'),
];

Movie movieinfo(int rank, String rating, String title, String subTitle, String imageUrl, String runTime) {
  return Movie(
    rank: rank,
    rating: rating,
    title: title,
    subTitle: subTitle,
    imageUrl: imageUrl,
    runTime: runTime,
  );
}
