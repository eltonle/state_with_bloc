part of 'items_bloc.dart';

sealed class ItemsState extends Equatable {
  const ItemsState();

  @override
  List<Object> get props => [];
}

final class ItemsLoadingState extends ItemsState {}

final class ItemsLoadedState extends ItemsState {
  final List<ItemModel> itemsList;

  const ItemsLoadedState({required this.itemsList});

  @override
  List<Object> get props => [itemsList];
}

final class ItemsErrorState extends ItemsState {
  final String errorMsg;

  const ItemsErrorState(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
