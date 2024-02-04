import 'package:cgv_clone/database_service.dart';
import 'package:flutter/material.dart';
import 'package:cgv_clone/models/movie.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.item});

  final Movie item;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<String> choices = ['GOOD!', 'BAD.'];
  int choice_index = 0;
  TextEditingController reviewIdControll = new TextEditingController();
  TextEditingController reviewTextControll = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Movie thisMovie = widget.item;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "관람평 등록",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black87,
          ),
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.black12,
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "이 영화 어땠나요?",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List<Widget>.generate(choices.length, (index) {
                      return ChoiceChip(
                        padding: EdgeInsets.all(10.0),
                        label: Text(
                          choices[index],
                          style: TextStyle(
                              color: (choice_index == index)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20),
                        ),
                        labelPadding: EdgeInsets.symmetric(horizontal: 50),
                        selected: choice_index == index,
                        onSelected: (value) {
                          setState(() {
                            choice_index = index;
                          });
                        },
                        backgroundColor: Colors.white,
                        selectedColor: Colors.red,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "나의 감상평",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: reviewIdControll,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '작성자',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: reviewTextControll,
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '내용',
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        if (reviewTextControll.text.isEmpty ||
                            reviewIdControll.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialog(
                                  content: Text("리뷰를 입력하세요."),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text("OK"))
                                  ],
                                ),
                          );
                        }
                        else{
                          addReview(thisMovie.title, reviewIdControll.text, reviewTextControll.text,
                              choices[choice_index]);
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        '제출',
                        style:
                        TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
