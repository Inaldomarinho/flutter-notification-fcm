## Recebendo notificações em um aplicativo flutter utilizando o firebase e o package firebase_messaging (Firebase Cloud Messaging for Flutter )

1. Crie um projeto no seu [console do firebase](https://console.firebase.google.com/u/0/) e adicione um Android App ao seu projeto e configure o seu aplicativo de acordo com os passos a passos do firebase.

2. Adicione o pacote firebase_messaging as dependências do seu projeto.

```
dependencies:
  firebase_messaging: ^6.0.13
```
 
3. Adicione o código abaixo em android/app/src/main/AndroidManifest.xml dentro das <activity>.

```
<intent-filter>
<action android:name="FLUTTER_NOTIFICATION_CLICK" />
<category android:name="android.intent.category.DEFAULT" />
</intent-filter>
```

4. Faça o listening de notificações (pode usar como base o [lib/main.dart](/lib/main.dart) que tem o código comentado) e faça as ações necessárias de acordo com a sua necessidade.


obs: caso queira implementar para IOS é necessário alguns passos mais que se encontram na [documentação do firebase_messaging](https://pub.dev/packages/firebase_messaging).

Para obter ajuda sobre como iniciar o Flutter, consulte a documentação online
[clicando aqui](https://flutter.dev/docs), que oferece tutoriais, 
amostras, orientações sobre desenvolvimento para dispositivos móveis e uma referência completa da API.

Para obter ajudar sobre o package firebase_messaging, consulte a documentação online [clicando aqui](https://pub.dev/packages/firebase_messaging).
