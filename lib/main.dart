import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('home page'),
        actions: const <Widget>[
          Icon(Icons.search),
          Icon(Icons.add),
          Icon(Icons.alarm),
        ],

      ),

      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: const Text('Strawberry Pavlova', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),)

                      ),
                      Container(
                          width: 170,
                          child: const Text('Pavlova is a mering-base dessert named after the Russian ballerine Anna Pavlova is a mering-base dessert named after the Russian ballerine Anna Pavlova is ', textAlign: TextAlign.center, )
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Color(0xFF67717B)),
                            Icon(Icons.star, color: Color(0xFF67717B)),
                            Icon(Icons.star, color: Color(0xFF67717B)),
                            Icon(Icons.star, color: Color(0xFF67717B)),
                            Icon(Icons.star, color: Color(0xFF67717B)),
                          ],
                        ),
                      ),
                      Container(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.kitchen, color: Color(0xFF67CFAB)),
                                  const Text('PREP:'),
                                  const Text('25 min'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.timer, color: Color(0xFF67CFAB)),
                                  const Text('COOK:'),
                                  const Text('1 hr'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.restaurant, color: Color(0xFF67CFAB)),
                                  const Text('FEEDS:'),
                                  const Text('4-6'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'asset/img_6.png' ,
                        width: 150,

                      ),
                      // Image.asset
                    ],
                  )
                ],


              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Trang 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Trang 3',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}