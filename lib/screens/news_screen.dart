import 'package:flutter/material.dart';
import 'package:exospace_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'package:exospace_app/services/services.dart';
import 'package:exospace_app/widgets/widgets.dart';

class NewsScreen extends StatefulWidget {
   
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final newService = Provider.of<NewsService>(context);

    return Container(
      child: newService.getArticles.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: AppTheme.primary,
            ),
          )
        : ListNews(noticias: newService.getArticles)
    );
  }

  @override
  bool get wantKeepAlive => true;
}