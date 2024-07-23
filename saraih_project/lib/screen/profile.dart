import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saraih_project/api-service/cache_services.dart';
import 'package:saraih_project/cons.dart';
import 'package:saraih_project/cubit/message-cubit/messages_cubit.dart';
import 'package:saraih_project/cubit/message-cubit/messages_state.dart';
import 'package:saraih_project/screen/editName.dart';
import 'package:saraih_project/screen/homepage.dart';
import 'package:saraih_project/screen/image.dart';
import 'package:saraih_project/screen/login.dart';
import 'package:saraih_project/screen/resetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile> {
   String? profileImagePath;
  String? name;
  @override


  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      profileImagePath = prefs.getString('profileImagePath');
     // name = prefs.getString('userName'); // Assuming userName is saved
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.purple,
        title: const Text(
          'Creativity is Required',
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: colors.purple,
              ),
              child: Text('user name'),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => home_page()),
                );
              },
            ),
            ListTile(
              title: const Text('Profile', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => profile()),
                );
              },
            ),
            ListTile(
              title:
                  const Text('Reset password', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPassword()),
                );
              },
            ),
            ListTile(
              title: const Text('Edit name', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditName()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout', style: TextStyle(fontSize: 20)),
              onTap: () {
                CacheService.removeData(key: 'token');
                print("$token is deleted");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: colors.purple,
                  child: CircleAvatar(
                    radius: 53,
                    backgroundImage: profileImagePath != null
                        ? FileImage(File(profileImagePath!))
                        : AssetImage('images/blank-profile-picture-973461_1280.png'),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImageChoice()),
                  );
                },
              ),
            ),
            Text(
              name !=null ? 'Welcome, $name!' : 'Welcome!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              height: 10,
              thickness: 3,
              color: colors.purple,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Text("Messages",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold)),
            ),
            BlocConsumer<MessagesCubit, MessagesState>(
              listener: (context, state) {},
              builder: (context, state) {
                if(state is GetMessagessuccessState){
                return SizedBox(
                  height: 200,
                  child:ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            color: colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                state.messages[index].message.toString(),
                                style: TextStyle(color: colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                );
                }
                else if(state is GetMessageserrorState){
                    return  Text('Error,try again');
                }
                else if (state is GetMessagesLoadingState)
                {
                 return CircularProgressIndicator();
                }else{
                  return  Text('Error');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
