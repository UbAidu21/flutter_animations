import 'package:flutter/material.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;
  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

const people = [
  Person(name: 'Ubaid', age: 20, emoji: '🙋🏻‍♂️'),
  Person(name: 'Uzair', age: 20, emoji: '👨🏻‍🎓'),
  Person(name: 'Afaq', age: 20, emoji: '🧔🏻'),
];

class _ExampleFourState extends State<ExampleFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animations'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsPage(person: person);
                  },
                ),
              );
            },
            leading: Hero(
              tag: person.emoji,
              child: Text(
                person.emoji,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            title: Text(person.name),
            subtitle: Text('${person.age} year old'),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Person person;
  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(
                        begin: 0.5,
                        end: 1.0,
                      ).chain(CurveTween(curve: Curves.fastOutSlowIn,),) ,
                    ),
                    child: toHeroContext.widget,
                  ),
                );
              case HeroFlightDirection.pop:
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(
                        begin: 0.5,
                        end: 1.0,
                      ).chain(CurveTween(curve: Curves.fastOutSlowIn,),) ,
                    ),
                    child: fromHeroContext.widget,
                  ),
                );
            }
          },
          tag: person.emoji,
          child: Text(
            person.emoji,
            style:const TextStyle(fontSize: 40),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Text(
            person.name,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            person.age.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ]),
      ),
    );
  }
}
