import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()=>(runApp(Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApiService(),
    );
  }
}

class ApiService extends StatefulWidget {
  const ApiService({Key? key}) : super(key: key);

  @override
  State<ApiService> createState() => _ApiServiceState();
}

class _ApiServiceState extends State<ApiService> {
  final _connect = GetConnect();

  _sendGetResponse() async{
    final response =
        await _connect.get('https://jsonplaceholder.typicode.com/posts/2');
    print(response.body);

  }

  void _SendPostRequest() async{
    final response = await _connect.post('https://jsonplaceholder.typicode.com/posts',{

    });
    return response.body;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Text(_sendGetResponse().title.toString()),
      body: ElevatedButton(
        child: Text('Get'),
        onPressed: (){
          _sendGetResponse();
        },
      ),
    );
  }
}
