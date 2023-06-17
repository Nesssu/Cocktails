import 'package:flutter/material.dart';

class Data
{
  static Data? _instance;
  Data._();
  static Data get instance {
    _instance ??= Data._();
    return _instance!;
  }

  // ignore: non_constant_identifier_names
  List<Object> SearchResult = [];
  // ignore: non_constant_identifier_names
  GetSearchResult() { return SearchResult; }
  // ignore: non_constant_identifier_names
  SetSearchResult(List<Object> NewList) { SearchResult = NewList; }
}

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cocktails"),
        ),
        body: Center(
          child: Column(
            children: [
              const SearchBar(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(value: 'Whiskey'),
                  Button(value: 'Vodka'),
                  Button(value: 'Gin'),
                  Button(value: 'Rum'),
                  Button(value: 'Tequila'),
                ],
              ),
              const HorizontalSeparator(),
              Expanded(
                child: ListView(
                  children: const [
                    CocktailButton(name: "Old Fashioned"),
                    CocktailButton(name: "Negroni"),
                    CocktailButton(name: "French Connection"),
                    CocktailButton(name: "Gimlet"),
                    CocktailButton(name: "Whiskey Sour"),
                    CocktailButton(name: "Godfather"),
                    CocktailButton(name: "White Russian"),
                    CocktailButton(name: "Espresso Martini"),
                    CocktailButton(name: "Vodka Martini"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CocktailButton extends StatelessWidget
{
  final String name;
  const CocktailButton({super.key, required this.name});

  // ignore: non_constant_identifier_names
  ButtonOnPress()
  {
    // ignore: avoid_print
    print(name);
  }

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 126, 126, 126).withOpacity(0.3),
              blurRadius: 10.0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 214, 214, 114)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          onPressed: ButtonOnPress,
          child: Text(
            name,
            style: const TextStyle(
              color: Color.fromARGB(255, 86, 86, 86),
              fontFamily: 'TiltPrism',
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          )
        )
      )
    );
  }
}

class HorizontalSeparator extends StatelessWidget
{
  const HorizontalSeparator({super.key});

  @override
  Widget build(BuildContext context)
  {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final dividerWidth = constraints.maxWidth * 0.9; // Calculate 90% of the screen width
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SizedBox(
            width: dividerWidth,
            child: const Divider(
              color: Color.fromARGB(255, 86, 86, 86),  // Set the desired color for the line
              thickness: 0.5,       // Set the desired thickness for the line
            ),
          )
        );
      },
    );
  }
}

class Button extends StatelessWidget
{
  final String value;
  const Button({super.key, required this.value});

  // ignore: non_constant_identifier_names
  ButtonOnPress()
  {
    // ignore: avoid_print
    print(value);
  }

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 126, 126, 126).withOpacity(0.3),
              blurRadius: 10.0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 214, 214, 214)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(20)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: ButtonOnPress,
          child: Text(
            value,
            style: const TextStyle(
              color: Color.fromARGB(255, 86, 86, 86)
            ),
          )
        )
      )
    );
  }
}

class SearchBar extends StatefulWidget
{
  const SearchBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
{
  String search = '';

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 126, 126, 126).withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
              style: const TextStyle(
                color: Color.fromARGB(255, 86, 86, 86)
              ),
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color.fromARGB(255, 214, 214, 214),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}