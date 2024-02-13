import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Search Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Coach",
              style: TextStyle(color: Colors.yellow, fontSize: 30),
            ),
            Text(
              "Cook",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  items: <String>['Salad', 'Soup', 'Rice', 'Pork', 'Chicken']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {

                  },
                  hint: Text('Select Category'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                Suggestion(
                  name: "Tom Yam Kung",
                  description:
                  "Tom yam kung, or spicy shrimp soup, is the number one of the top ten Thai dishes loved by foreigners.",
                  url:
                  "https://hot-thai-kitchen.com/wp-content/uploads/2013/03/tom-yum-goong-blog.jpg",
                  boxColor: Colors.yellow,
                ),
                Suggestion(
                  name: "Kaeng Khiao Wan",
                  description:
                  "Ranking second among the ten Thai dishes ordered most frequently by foreigners, a green chicken curry gained an 85% popularity.",
                  url:
                  "https://i.guim.co.uk/img/media/2f18f5a49694c482c1476bc51949e38a07b1c097/86_1686_4662_4662/master/4662.jpg?width=700&quality=85&auto=format&fit=max&s=0410e79f847cf5d3ddfebc5604cdd2f2",
                  boxColor: Colors.yellow,
                ),
                Suggestion(
                  name: "Yam Nua",
                  description:
                  "Ranking seventh in the top ten list of Thai food loved by foreigners, Yam Nua or spicy beef salad is a mouth-watering dish.",
                  url:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyiDay_1xYbI77ug2fxiCGzX4dceQz23HtsvszmUvXQ&",
                  boxColor: Colors.yellow,
                ),
                Suggestion(
                  name: "Phat Kaphrao",
                  description:
                  "Ranking fourth among the ten Thai dishes ordered most frequently by foreigners, Phat Kaphrao can have any kind of meat as its main ingredient.",
                  url:
                  "https://hot-thai-kitchen.com/wp-content/uploads/2022/10/pad-gaprao-beef-sq-2.jpg",
                  boxColor: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Suggestion extends StatelessWidget {
  Suggestion({
    Key? key,
    required this.name,
    required this.description,
    required this.url,
    required this.boxColor,
  }) : super(key: key);

  final String name;
  final String description;
  final String url;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: boxColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              url,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  this.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(this.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

