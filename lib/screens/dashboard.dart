import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  int currentPageIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String firstnamevalue = "";
  String? test = null;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Students',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.person)),
            label: 'Instructors',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.dashboard),
            ),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.money),
            ),
            label: 'Finance',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.settings),
            ),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Welcome ',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),

        /// Instructors
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const Text(
                "All instructors",
              ),
              TextField(

              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Judith Chai'),
                  subtitle: Text('Piano Instructor'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Jane Williams'),
                  subtitle: Text('Violin and Trumpet Instructor'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        const Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(

            children: [
              const Text(
                "Welcome back, Ethan Chen",
                style: TextStyle(height: 5, fontSize: 20),
              ),
              const Text(
                "Instrument: Piano",
                style: TextStyle(height: 2, fontSize: 15),
              ),
              const Text(
                "Skill Level: Intermediate",
                style: TextStyle(height: 2, fontSize: 15),
              ),
              const Text(
                "Age: 20",
                style: TextStyle(height: 2, fontSize: 15),
              ),
              const Text(
                "Instructor: Judith Chai",
                style: TextStyle(height: 2, fontSize: 15),
              ),

              const Text(
                "My classes",
                style: TextStyle(height:4, fontSize: 15),
              ),


            ],
          ),
        ),

        Form(key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return "Please enter a last name";
                          }
                          else
                          {
                            firstnamevalue = value;
                            print (value);
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search by last name',
                        ),
                        keyboardType: TextInputType.text

                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Hang on while we register you...')),
                          );
                        }

                      },
                      child: const Text('Submit'),
                    ),

                  ],
                )
            )
        ),


        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
              'Settings',
              style: theme.textTheme.titleLarge,
            ),

            ),
          ),
        ),

      ][currentPageIndex],
    );
  }
}
