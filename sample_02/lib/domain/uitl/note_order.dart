import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note/domain/uitl/order_type.dart';

part 'note_order.freezed.dart';

@freezed
sealed class NoteOrder with _$NoteOrder {
  const factory NoteOrder.title(OrderType type) = NoteOrderTitle;
  const factory NoteOrder.date(OrderType type) = NoteOrderDate;
  const factory NoteOrder.color(OrderType type) = NoteOrderColor;
}