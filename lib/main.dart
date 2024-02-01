import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_with_bloc/bloc/items_bloc.dart';
import 'package:state_with_bloc/cubit/user_cubit.dart';
import 'package:state_with_bloc/locator.dart';
import 'package:state_with_bloc/my_bloc_observed.dart';
import 'package:state_with_bloc/repositories/items_repository.dart';
import 'package:state_with_bloc/view/home/home_view.dart';

import 'repositories/user_repository.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setup();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => ItemRepository(),
      ),
      RepositoryProvider(
        create: (context) => UserRepository(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemsBloc(ItemRepository()),
        ),
        BlocProvider(
          create: (context) => UserCubit(UserRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Statge management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
