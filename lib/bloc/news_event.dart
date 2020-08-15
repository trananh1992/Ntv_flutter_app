part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {}

class FetchNewsEvent extends NewsEvent {

  final String nodeId;

  FetchNewsEvent({@required this.nodeId}) : assert(nodeId != null);

  @override
  List<Object> get props => [];
}
