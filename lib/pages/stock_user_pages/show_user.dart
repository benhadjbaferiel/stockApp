import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/pages/stock_user_pages/add_user.dart';
import 'package:stock_dz_app/providers/userProvider.dart';

class ShowUsers extends StatelessWidget {
  const ShowUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("عرض المستخدمين"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              final user = userProvider.users[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ExpansionTile(
                  title: Text(user.username),
                  subtitle: Text('كود المستخدم: ${user.code}'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'كل الصلاحيات: ${user.boolValue ? "نعم" : "لا"}'),
                          Text(
                              'عرض فواتير المبيعات: ${user.boolValue1 ? "نعم" : "لا"}'),
                          Text(
                              'تعديل فواتير المبيعات: ${user.boolValue2 ? "نعم" : "لا"}'),
                          // Add all other permissions here
                        ],
                      ),
                    ),
                  ],
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddUser(
                                isEditing: true,
                                userToEdit: user,
                                userIndex: index,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          userProvider.deleteUser(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUser()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
