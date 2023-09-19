import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rf_test/models/news_model.dart';
import 'package:rf_test/provider/news_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     NewsModel news = ref.watch(newsProvider).newsModel;
     bool isLoading = ref.watch(newsProvider).isLoading;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: isLoading? const Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: news.results?.length,
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                    children: [
                      Text(news.results![index].title.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 12,),
                      Text(news.results![index].description.toString()),
                    ],
                  ),
            );
          }),

    );
  }
}
