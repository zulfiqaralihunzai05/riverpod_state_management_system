import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management_system/Data/data_provider.dart';
import 'package:riverpod_state_management_system/Models/user_model.dart';
import 'package:riverpod_state_management_system/Screens/details_screen.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("RiverPod"),
        ),
        body: _data.when(
            data: (_data) {
              List<UserModel> userList = _data.map((e) => e).toList();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: userList.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () => Navigator.of(context)
                                    .push(
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                              e: userList[index],
                                            ),),),
                                child: Card(
                                  color: Colors.blue,
                                  elevation: 4,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    title: Text(
                                      userList[index].first_name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      userList[index].last_name,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    trailing: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(userList[index].avatar),
                                    ),
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
