import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:cmsna/features/home/presentation/pages/homepage.dart';
import 'package:cmsna/features/search/presentation/pages/search_main.dart';
import 'package:cmsna/features/contact/presentation/contact_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: Homepage(),
      ),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: SearchPage(),
      ),
    ),
    GoRoute(
      path: '/contact',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: ContactMePage(),
      ),
    ),
    // Add other routes here
  ],
);
