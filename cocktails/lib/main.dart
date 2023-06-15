import 'package:flutter/material.dart';
void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cocktails"),
        ),
        body: const Center( 
          child: Column(
            children: [
              SearchBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                  [
                    Button(value: 'Whiskey'),
                    Button(value: 'Vodka'),
                    Button(value: 'Gin'),
                    Button(value: 'Rum'),
                    Button(value: 'Tequila'),
                  ],
              ),
              HorizontalSeparator(),

            ],
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
          padding: const EdgeInsets.all(10.0),
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
          onPressed: () {},
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