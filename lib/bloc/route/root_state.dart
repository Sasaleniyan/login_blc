import 'package:equatable/equatable.dart';

class RouteState extends Equatable {
  final RouteType type;
  final Object? data;
  const RouteState({required this.type, this.data});
  @override
  List<Object> get props => [type];

  RouteState copyWith({
    required RouteType type,
    Object? data,
  }) {
    return RouteState(type: type, data: data);
  }
}

enum RouteType {
  login,
  home,
}
