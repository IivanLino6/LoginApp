import 'package:flutter/material.dart';
import 'package:login_app/Presentation/Pages/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    HomeViewModel vm = Provider.of<HomeViewModel>(context);
    //final currentTab = [PostListPage(), PostMyListPage(), ProfilePage()];

    return Scaffold(
        appBar: AppBar(
          //backgroundColor: const Color.fromARGB(255, 3, 162, 248),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 3, 162, 248),
          child: Column(
            children: [
              // Otros elementos del Drawer aquí...
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 70,
                        bottom: 20), // Añade espacio alrededor del botón
                    child: ListTile(
                      leading: const Icon(Icons.logout, color: Colors.white),
                      title: const Text('Logout',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onTap: () async {
                        // Acción al tocar el botón de logout
                        await vm.logout();
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'login', (route) => false);
                      },
                    ), // ListTile
                  ), // Padding
                ), // Align
              ), // Expanded
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 162, 248),
        body: Container(
          color: Colors.white,
        ) ,
        //body: currentTab[vm.currentIndex],
        //bottomNavigationBar: HomeBottombar(context, vm),
        ); 
  }
}