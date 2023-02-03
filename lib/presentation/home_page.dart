import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/crud_page.dart';
import 'package:get/get.dart';
import '../providers/auth_provider.dart';
import '../services/crud_service.dart';
import 'create_page.dart';

class HomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvider);
     final productData = ref.watch(products);
    FlutterNativeSplash.remove();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Shop'),
      ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(auth.user!.email),
              ),
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                },
                leading: Icon(Icons.email),
                title: Text(auth.user!.email),
              ),
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  Get.to(() => CreatePage(), transition: Transition.leftToRight);
                },
                leading: Icon(Icons.add),
                title: Text('Create Product'),
              ),

              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  Get.to(() => CrudPage(), transition: Transition.leftToRight);
                },
                leading: Icon(Icons.settings),
                title: Text('Customize Product'),
              ),

              ListTile(
                onTap: (){
                   ref.read(authProvider.notifier).userLogOut();
                },
                leading: Icon(Icons.exit_to_app),
                title: Text('Log Out'),
              ),
            ],
          )

        ),
        body:  Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: productData.when(
              data: (data){
                return GridView.builder(
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 2/3
                    ),
                  itemBuilder: (context, index){
                      return GridTile(
                        child: Image.network(data[index].image, fit: BoxFit.cover,),
                        footer: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          height: 45,
                          color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${data[index].product_name}'),
                              SizedBox(height: 10,),
                              Text('${data[index].price}'),
                            ],
                          ),
                        )
                      );
                  },
                );
              },
              error: (err, stack) => Center(child: Text('$err')),
              loading: () => Center(child: CircularProgressIndicator())
          ),
        )
    );
  }
}
