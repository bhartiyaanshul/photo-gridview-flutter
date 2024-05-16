import 'dart:developer';

import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List imageList = [
    'https://fastly.picsum.photos/id/480/200/200.jpg?hmac=q_kzh_8Ih85_5t_jN3rcD3npeNBLA41oDGtQZVkmmYs',
    'https://fastly.picsum.photos/id/117/200/200.jpg?hmac=hAXY0lMbkjkxYIKxW0UjtazVquGY1NCu3ruHLJGc4gs',
    'https://fastly.picsum.photos/id/1039/200/200.jpg?hmac=VpGJWDIq64ZdzDD5NAREaY7l5gX14vU5NBH84b5Fj-o',
    'https://fastly.picsum.photos/id/5/200/200.jpg?hmac=oN9VtXdJYLSFssji8vCr48JaI-e5Zi4eH9GAiYBB_Ig',
    'https://fastly.picsum.photos/id/335/200/200.jpg?hmac=CS4kiSEelfhSQQtW7j6SFUV2ZlTmUV1vaX2iZKnbx7c',
    'https://fastly.picsum.photos/id/1003/200/200.jpg?hmac=w2SN03yog7_RB-IfnyWX1FtBjSHebnoWD35Lj4-iV7o',
    'https://fastly.picsum.photos/id/575/200/200.jpg?hmac=u8uMtAWK-6Ug08Vo4nf84xQLlwJqyrXpfzsU9a3YpCY',
    'https://fastly.picsum.photos/id/351/200/200.jpg?hmac=E2C8OwTRNgbEan5RzifMH73ENtpcsHSr45mGFQk5mPU',
    'https://fastly.picsum.photos/id/717/200/200.jpg?hmac=bKg3Tgutvsprm3Nh_kFIbGVlWJaT334I_qZCDn_INZ8',
    'https://fastly.picsum.photos/id/682/200/200.jpg?hmac=098XkPnTe9a41I6BtB9xV4t6L8c3ESkdowMLElFBR5A',
    'https://fastly.picsum.photos/id/435/200/200.jpg?hmac=yk7-HtvV0x2Z6OB4YhbyAbYxX0nQQCNTzs_MgegSkcE',
    'https://fastly.picsum.photos/id/426/200/200.jpg?hmac=5auPuax0L2lXSIX0eJ2Qxa3HzmGUHCrGDPIEMAWgw7o',
    'https://fastly.picsum.photos/id/73/200/200.jpg?hmac=IYjgRq-Ok9gn3_MVxJ4TlfhLPONQ97qWvp2Ir1Y1z6c',
    'https://fastly.picsum.photos/id/827/200/200.jpg?hmac=7S4fBvNQXv9S9XZnxThhj6tOFH_ktFgHQ8xkIW9lNcQ',
    'https://fastly.picsum.photos/id/965/200/200.jpg?hmac=OalaXaaPbpRZbMwF3uJMUdZIpUmyqse0anUnQcbStrM'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PHOTOS', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 137, 84, 230),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.white,))
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {},child: const Icon(Icons.login),),
      // body: const Column(
        // children: <Widget>[
          // Banner(message: "message", location:BannerLocation.topStart),
          // AnimatedSizeExample(),
          // ElevatedButtonWidget(),
          // FormWidget()
       // ],
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(2),
              color: const Color.fromARGB(255, 137, 84, 230),
              child: Image.network(imageList[index]),
            ),
            onTap: ()  {
              showDialog(
                context: context, 
                builder: (BuildContext context){
                  return GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: GestureDetector(
                        onDoubleTap: () {
                          launchUrl(Uri.parse(imageList[index]));
                        },
                        child: Image.network(imageList[index]))
                    )
                  );
                }
              );
            },
          );  
        }
      )
      // GridView.count(
      //   padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
      //   mainAxisSpacing: 10,
      //   crossAxisSpacing: 10,
      //   crossAxisCount: 2,
      //   children: List.generate(imageList.length, (index) {
      //     return GestureDetector(
      //       child: Container(
      //         padding: const EdgeInsets.all(2),
      //         color: const Color.fromARGB(255, 137, 84, 230),
      //         child: Image.network(imageList[index]),
      //       ),
      //       onTap: ()  {
      //         showDialog(
      //           context: context, 
      //           builder: (BuildContext context){
      //             return GestureDetector(
      //               onTap: () => Navigator.pop(context),
      //               child: BackdropFilter(
      //                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      //                 child: GestureDetector(
      //                   onDoubleTap: () {
      //                     launchUrl(Uri.parse(imageList[index]));
      //                   },
      //                   child: Image.network(imageList[index]))
      //               )
      //             );
      //           }
      //         );
      //       },
      //     );  
      //   }),       
      // ),
    );
  }
}

class ElevatedButtonWidget extends StatefulWidget {
  const ElevatedButtonWidget({super.key});

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const ElevatedButton(
            onPressed: null,
            child: Text('Disabled')
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              log("enabled pressed");
            },
            child: const Text('Enabled'),
          )
        ],
      ),
    );
  }
}

class AnimatedSizeExample extends StatefulWidget {
  const AnimatedSizeExample({super.key});

  @override
  State<AnimatedSizeExample> createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample> {
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () => _updateSize(),
        child: ColoredBox(
          color: const Color.fromARGB(255, 137, 84, 230),
          child: AnimatedSize(
            curve: Curves.easeIn,
            duration: const Duration(seconds: 1),
            child: FlutterLogo(size: _size),
          ),
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Username"
              ),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return 'Please enter username';
                }
                return null;
              },
            ),
          ), 
          Padding(
            padding: const EdgeInsets.fromLTRB(30,5,30,20),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Password"
              ),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return 'Please enter password';
                }
                return null;
              },
            ),
          ), 
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                }
                },
                child: const Text("Submit"),
              ),
            ),
          )          
        ],
      )
    );
  }
}