import 'package:flutter/material.dart';
import 'package:sample_project/login.dart';

class HomeScreen extends StatefulWidget {


  final String username;

  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                          ),
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) =>  const Login()));
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                          ),
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              color: Colors.white,
              icon: const Icon(Icons.logout)),
        ],
        backgroundColor: Colors.blue.shade900,
        title: const Text('Dashboard',style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: [
            Center(
              child: Text('Welcome, ${widget.username}',style: const TextStyle(fontSize: 25,color: Colors.indigo)),
            ),
            const Center(
              child: Text('Search',style: TextStyle(fontSize: 25,color: Colors.indigo)),
            ),
            const Center(
              child: Text('Notification',style: TextStyle(fontSize: 25,color: Colors.indigo)),
            ),
            const Center(
              child: Text('Cart',style: TextStyle(fontSize: 25,color: Colors.indigo)),
            ),
            const Center(
              child: Text('Profile',style: TextStyle(fontSize: 25,color: Colors.indigo)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlueAccent,
        currentIndex: _currentIndex,
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue[900],
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.search_rounded),
            label: 'Search',
            backgroundColor: Colors.blue[900],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: 'Notification',
            backgroundColor: Colors.blue[900],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_shopping_cart),
            label: 'cart',
            backgroundColor: Colors.blue[900],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.blue[900],
          ),
        ],
        onTap: (index){
          setState((){
            _currentIndex=index;
          });
        },
      ),
    );
  }

}
