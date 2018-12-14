import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc_provider.dart';
import 'package:flutter_bloc_example/home_screen_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Example',
      home: BlocProvider<HomeScreenBloc>(
          bloc: HomeScreenBloc(), child: HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenBloc _homeScreenBloc;

  @override
  void dispose() {
    _homeScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BLoC Example'),
      ),
      body: Center(
        child: StreamBuilder(
          initialData: false,
          stream: _homeScreenBloc.isCheckedStream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  CheckboxListTile(
                      title: Text('This will add new value to stream on press'),
                      value: snapshot.data,
                      onChanged: (bool isChecked) {
                        _homeScreenBloc.updateIsChecked(isChecked);
                      }),
                  Divider(height: 0, color: Colors.black),
                  SizedBox(height: 30),
                  snapshot.data
                      ? Text('The checkbox is checked!')
                      : Text('The checkbox is not checked(')
                ],
              );
            } else {
              return Text('There is no data in bloc');
            }
          },
        ),
      ),
    );
  }
}
