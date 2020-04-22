import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingDemo extends StatefulWidget {

  final String title = 'Firebase Messaging Demo';

  @override
  _FirebaseMessagingDemoState createState() => _FirebaseMessagingDemoState();
}

class _FirebaseMessagingDemoState extends State<FirebaseMessagingDemo> {

  // Criando o objeto FirebaseMessaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  // Lista de notificações recebidas
  List<Message> _messages;

  // Método para receber o token da API ao iniciar o APP
  _getToken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      print('Device Token: $deviceToken');
    });
  }

  // Método para fazer o listening das notificações
  _configureFirebaseListeners() {
    _firebaseMessaging.configure(
      // onMessage: Método chamado ao receber notificação com o app aberto
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        _setMessage(message, 'onMessage');
      },
      // onLaunch: Método chamado ao receber notificação com o app fechado
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _setMessage(message, 'onLaunch');
      },
      // onResume: Método chamado ao receber notificação com o app aberto em background
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _setMessage(message, 'onResume');
      }
    );
  }

  // Ao receber uma notificação cria um objeto do tipo Message e
  // adiciona o mesmo na lista de notificações
  _setMessage(Map<String, dynamic> message, String method){
    final notification = message['notification'];
    final data = message['data'];

    final String title = notification['title'];
    final String body = notification['body'];
    final String nMessage = data['message'];

    setState(() {
      Message m = Message(title, body, nMessage, method);
      _messages.add(m);
    });
  }

  @override
  void initState() {
    super.initState();
    _messages = List<Message>();
    _getToken();
    _configureFirebaseListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Notification DEMO'),
      ),
      body: ListView.builder(
        itemCount: null == _messages ? 0 : _messages.length,
        itemBuilder: (context, index) =>
          Card(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _messages[index].message,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Método: ${_messages[index].method}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

// Objeto Message para armazenar a notificação
class Message {
  String title;
  String body;
  String message;
  String method;
  Message(title, body, message, method) {
    this.title = title;
    this.body = body;
    this.message = message;
    this.method = method;
  }
}