import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/decrement_counter.dart';
import 'package:flutter_provider/providers/increment_counter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => IncrementCounterProvider()),
        ChangeNotifierProvider(builder: (_) => DecrementCounterProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final incrementCounterProvider = Provider.of<IncrementCounterProvider>(context);
    final decrementCounterProvider = Provider.of<DecrementCounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the increment button this many times:',
            ),
            Text(
              '${incrementCounterProvider.counter}',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 32),
            Text(
              'You have pushed the decrement button this many times:',
            ),
            Text(
              '${decrementCounterProvider.counter}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed:
                incrementCounterProvider.loading ? null : incrementCounterProvider.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
            backgroundColor: incrementCounterProvider.loading ? Colors.grey : null,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed:
                decrementCounterProvider.loading ? null : decrementCounterProvider.decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            backgroundColor: decrementCounterProvider.loading ? Colors.grey : null,
          )
        ],
      ),
    );
  }
}
