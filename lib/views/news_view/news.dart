import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/app/models/providers.dart';

class NewsView extends ConsumerStatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsViewState();
}

class _NewsViewState extends ConsumerState<NewsView> {
  @override
  void initState() {
    ref.read(newsViewmodelProvider.notifier).getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.read(newsViewmodelProvider.notifier);
    final state = ref.watch(newsViewmodelProvider);
    bool isDark = state.isChecked;

    return Scaffold(
      backgroundColor: isDark ? Colors.black12 : null,
      appBar: AppBar(
        title: const Text('NEWS APP'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              CupertinoSwitch(
                value: state.isChecked,
                onChanged: (val) => model.upDateChecked(val),
              ),
            ],
          ),
          state.isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : SizedBox(
                  height: MediaQuery.of(context).size.height - 130,
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(15),
                    itemCount: state.news.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (_, i) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          state.news[i].url!,
                        ),
                      ),
                      title: Text(
                        state.news[i].author!,
                        style: TextStyle(
                          color: isDark ? Colors.white : null,
                        ),
                      ),
                      subtitle: Text(
                        state.news[i].title!,
                        style: TextStyle(
                          color: isDark ? Colors.white : null,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
