# Elo7 APP

O Elo7 App  permite que os usuários visualizem informações sobre a empresa, além de ser possível pesquisar por vagas.

### 📋 Pré-requisitos

* [Flutter](https://docs.flutter.dev/get-started/install)
* [Dart SDK](https://dart.dev/get-dart) (Ao instalar o flutter o Dart SDK é instalado também) 
* [Emulador](https://developer.android.com/studio/run/managing-avds?hl=pt-br)

### 📌 Versão utilizada

* Flutter 3.22.0-5.0.pre.16 • channel master
* Dart 3.5.0

### 🔧 Instalação

- Faça o git clone ou donwload desse repositório
- Procure o local onde o projeto via terminal ou editor de texto (Caso o projeto seja baixado via zip, é necessário extraí-lo antes de procurá-lo)
- É necessário rodar flutter pub get para garantir que as dependências sejam instaladas
  ```
   flutter pub get
  ```
- Depois basta rodar o comando flutter run na pasta do projeto
  ```
   flutter run
  ```

Para ter acesso ao apk, basta rodar o comando abaixo
  ```
    flutter build apk --release
  ```

Após rodar o comando, seguir o caminho  build\app\outputs\flutter-apk\app-release.apk e fazer a instação no dispositivo Android

## ⚙️ Executando os testes

Para executar os testes, basta rodar o comando abaixo no terminal do projeto 
 ```
    flutter pub run build_runner build
 ```
Esse comando irá apagar os arquivos mocks gerados pelo Mockito e depois irá reconstui-los novamente. 

## 🛠️ Construído com

* [Flutter](https://flutter.dev/) - O framework web usado
* [GetX](https://chornthorn.github.io/getx-docs/) - Gerenciador de Estados e Injeção de Ddpendências
* [Mockito](https://pub.dev/packages/mockito) - Gerador de Mocks para os tests
* [Dio](https://pub.dev/packages/dio) - Pacote Http 


