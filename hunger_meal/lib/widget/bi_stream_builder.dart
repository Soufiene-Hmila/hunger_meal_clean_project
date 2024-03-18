import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

typedef AsyncWidgetBuilder<T1, T2> = Widget Function(
    BuildContext context, Tuple2<AsyncSnapshot<T1>, AsyncSnapshot<T2>> snapshots);

class BiStreamBuilder<T1, T2> extends StatefulWidget {

  final Tuple2<T1, T2>? initialData;
  final Tuple2<Stream<T1>, Stream<T2>> streams;
  final AsyncWidgetBuilder<T1, T2> builder;

  const BiStreamBuilder({Key? key, required this.streams, required this.builder, this.initialData}) : super(key: key);

  @override
  BiStreamBuilderState<T1, T2> createState() => BiStreamBuilderState<T1, T2>();
}

class BiStreamBuilderState<T1, T2> extends State<BiStreamBuilder<T1,T2>> {

  late Tuple2<T1, T2>? initialData;
  late Tuple2<Stream<T1>, Stream<T2>> streams;
  late AsyncWidgetBuilder<T1, T2> builder;

  @override
  void initState() {
    initialData = widget.initialData;
    streams = widget.streams;
    builder = widget.builder;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BiStreamBuilder<T1, T2> oldWidget) {
    if(widget.streams != oldWidget.streams || widget.builder != oldWidget.builder
        || widget.initialData != oldWidget.initialData){
      initialData = widget.initialData;
      streams = widget.streams;
      builder = widget.builder;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext _) {
    return StreamBuilder<T1>(
      initialData: initialData?.item1,
      stream: streams.item1,
      builder: (_, snapshot1) {
        return StreamBuilder<T2>(
          initialData: initialData?.item2,
          stream: streams.item2,
          builder: (context, snapshot2) {
            return builder(context, Tuple2(snapshot1, snapshot2));
          },
        );
      },
    );
  }
}