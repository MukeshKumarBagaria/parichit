1. Install package
Run this command to install the required dependencies.
Code:
File: Code
```
flutter pub add supabase_flutter
```

2. Add files
Copy the following code into your project.
Code:
File: lib/main.dart
```
1import 'package:flutter/material.dart';
2import 'package:supabase_flutter/supabase_flutter.dart';
3
4Future<void> main() async {
5  await Supabase.initialize(
6    url: 'https://qqjhfcibcxerkwxdfynd.supabase.co',
7    publishableKey: 'sb_publishable_VvGo0ZvwB8QyXdBMmjAZXw_WZxA7NyA',
8  );
9  runApp(MyApp());
10}
```

File: lib/main.dart (app)
```
1class MyApp extends StatelessWidget {
2  const MyApp({super.key});
3
4  @override
5  Widget build(BuildContext context) {
6    return const MaterialApp(
7      title: 'Todos',
8      home: HomePage(),
9    );
10  }
11}
12
13class HomePage extends StatefulWidget {
14  const HomePage({super.key});
15
16  @override
17  State<HomePage> createState() => _HomePageState();
18}
19
20class _HomePageState extends State<HomePage> {
21  final _future = Supabase.instance.client
22      .from('todos')
23      .select();
24
25  @override
26  Widget build(BuildContext context) {
27    return Scaffold(
28      body: FutureBuilder(
29        future: _future,
30        builder: (context, snapshot) {
31          if (!snapshot.hasData) {
32            return const Center(child: CircularProgressIndicator());
33          }
34          final todos = snapshot.data!;
35          return ListView.builder(
36            itemCount: todos.length,
37            itemBuilder: ((context, index) {
38              final todo = todos[index];
39              return ListTile(
40                title: Text(todo['name']),
41              );
42            }),
43          );
44        },
45      ),
46    );
47  }
48}
```

3. Install Agent Skills (optional)
Agent Skills give AI coding tools ready-made instructions, scripts, and resources for working with Supabase more accurately and efficiently.
Code:
File: Code
```
npx skills add supabase/agent-skills
```