// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterStore on _CounterStore, Store {
  late final _$counterValueAtom =
      Atom(name: '_CounterStore.counterValue', context: context);

  @override
  int get counterValue {
    _$counterValueAtom.reportRead();
    return super.counterValue;
  }

  @override
  set counterValue(int value) {
    _$counterValueAtom.reportWrite(value, super.counterValue, () {
      super.counterValue = value;
    });
  }

  late final _$_CounterStoreActionController =
      ActionController(name: '_CounterStore', context: context);

  @override
  void incrementCounter() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.incrementCounter');
    try {
      return super.incrementCounter();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementCounter() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.decrementCounter');
    try {
      return super.decrementCounter();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCounter() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.resetCounter');
    try {
      return super.resetCounter();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counterValue: ${counterValue}
    ''';
  }
}
