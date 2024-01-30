// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:state_with_bloc/models/item_model.dart';
import 'package:state_with_bloc/repositories/items_repository.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsLoadedEvent, ItemsState> {
  final ItemRepository itemRepository;
  ItemsBloc(
    this.itemRepository,
  ) : super(ItemsLoadingState()) {
    on<ItemsLoadedEvent>(_ItemsLoadedEvent);
  }

  FutureOr<void> _ItemsLoadedEvent(
      ItemsLoadedEvent event, Emitter<ItemsState> emit) async {
    try {
      var data = await itemRepository.getItems();
      emit(ItemsLoadedState(itemsList: data));
    } catch (e) {
      emit(ItemsErrorState(e.toString()));
    }
  }
}
