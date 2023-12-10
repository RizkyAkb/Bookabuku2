import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookaBuku',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 72, 194, 247)),
        useMaterial3: true,
        fontFamily: 'Quicksand',
      ),
      home: const MyHomePage(title: 'BookaBuku'),
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
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    BookShelfScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Rak Buku',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 235,
            margin: EdgeInsets.all(16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(0xFF3EC6FF),
              // elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 0, 5),
                    child: const ListTile(
                      title: Text('Hai, userName',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.network(
                                  'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1639163872l/58293924.jpg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // alignment: Alignment.topRight,
                                  child: Text("bookTitle123",
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF3EC6FF))),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text("4.5 / 5",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF3EC6FF))),
                                ),
                                Container(
                                    // alignment: Alignment.bottomRight,
                                    child: Container(
                                  width: 100,
                                  height: 35,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text("Lihat buku   >",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xFF3EC6FF)),
                                  ),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text("Rekomendasi",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3EC6FF))),
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Row(
                  children: [
                    bookList(),
                    bookList(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Row(
                  children: [
                    bookList(),
                    bookList(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Row(
                  children: [
                    bookList(),
                    bookList(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class bookList extends StatelessWidget {
  const bookList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Card(
              elevation: 0,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1639163872l/58293924.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text("Book Of Night",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3EC6FF))),
          Text("4.5/5",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3EC6FF))),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(21),
            child: SearchBar(
              elevation: MaterialStateProperty.all(0.0),
              side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.blue)),
              hintText: 'Cari buku',
              hintStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.grey)),
              trailing: [
                const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ],
              onSubmitted: (String value) {
                print('value: $value');
              },
            ),
          ),
          Center(
            child: Text(
              (() {
                if (true) {
                  return "Maaf buku yang kamu cari tidak tersedia";
                } else {
                  return "Buku tidak ada";
                }
              })(),
              style: TextStyle(
                  fontSize: 16.0,
                  // fontWeight: FontWeight.bold,
                  color: Color(0xFF3EC6FF)),
            ),
          )
        ],
      ),
    );
  }
}

class BookShelfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 32, 16, 32),
            child: Text('Rak Buku',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3EC6FF))),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Row(
                  children: [
                    rakList(),
                    rakList(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Row(
                  children: [
                    rakList(),
                    rakList(),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 200,
            height: 45,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF3EC6FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    var emailController = TextEditingController();
                    var messageController = TextEditingController();
                    return AlertDialog(
                      title: Text('Tambah Rak'),
                      insetPadding: EdgeInsets.all(16),
                      content: SingleChildScrollView(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(hintText: 'Nama Rak'),
                          ),
                        ],
                      )),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Send them to your email maybe?
                            var email = emailController.text;
                            print(email);
                            Navigator.pop(context);
                          },
                          child: Text('Simpan'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Tambah Rak",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FloatingActionButton.extended(
            backgroundColor: const Color(0xFF3EC6FF),
            foregroundColor: Color(0xffffffff),
            onPressed: () {
              // Respond to button press
            },
            icon: Icon(Icons.add),
            label: Text('Tambah Rak'),
          ),
        ],
      ),
    );
  }
}

class rakList extends StatelessWidget {
  const rakList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // margin: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Color(0xFF3EC6FF),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem<int>(
                            value: 0,
                            child: Text("Ubah nama"),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: Text("Hapus rak"),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        if (value == 0) {
                          print("My account menu is selected.");
                        } else if (value == 1) {
                          print("Settings menu is selected.");
                        }
                      }),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text("Sedang dibaca",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  (() {},);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.blue,
                  size: 35,
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.5,
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.4,
                  // color: Color(0xFF3EC6FF),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1639163872l/58293924.jpg',
                      fit: BoxFit.contain,
                    ),
                    // color: Color(0xFF3EC6FF),
                  ),
                ),
                Text("Lorem Ipsum",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3EC6FF))),
                Text("Dolor Sit Amet",
                    style: TextStyle(
                        fontSize: 15.0,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFF3EC6FF))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
            width: MediaQuery.of(context).size.width,
            height: 70,
            // color: Colors.blue,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("bookPages"),
                      Text(
                        "212",
                        style: TextStyle(
                            color: Color(0xFF3EC6FF),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("bookGenre"),
                      Text(
                        "Horor",
                        style: TextStyle(
                            color: Color(0xFF3EC6FF),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("bookRating"),
                      Text(
                        "4,9/5",
                        style: TextStyle(
                            color: Color(0xFF3EC6FF),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(24),
            child: Text(
              "The Bottom Navigation bar has become popular in the last few years for navigation between different UI. Many developers use bottom navigation because most of the app is available now using this widget for navigation between different screens.The bottom navigation bar in Flutter can contain multiple items such as text labels, icons, or both. It allows the user to navigate between the top-level views of an app quickly. If we are using a larger screen, it is better to use a side navigation bar.In Flutter application, we usually set the bottom navigation bar in conjunction with the scaffold widget. Scaffold widget provides a Scaffold.bottomNavigationBar argument to set the bottom navigation bar. It is to note that only adding BottomNavigationBar will not display the navigation items. It is required to set the BottomNavigationItems for Items property that accepts a list of BottomNavigationItems widgets.Remember the following key points while adding items to the bottom navigation bar:We can display only a small number of widgets in the bottom navigation that can be 2 to 5.It must have at least two bottom navigation items. Otherwise, we will get an error.It is required to have the icon and title properties, and we need to set relevant widgets for them.",
              style: TextStyle(
                fontSize: 15.0,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
          )
        ],
      ),
    );
  }
}
