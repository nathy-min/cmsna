import 'package:cmsna/app.dart';
import 'package:cmsna/features/blog/presentation/bloc/blog_bloc/blog_bloc.dart';

import 'package:cmsna/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => serviceLocator<BlogBloc>())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainPage(),
          ),
        );
      },
    );
  }
}
