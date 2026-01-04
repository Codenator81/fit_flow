// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseCompletion {

 DateTime get date; int get maxSets; int get maxReps;
/// Create a copy of ExerciseCompletion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseCompletionCopyWith<ExerciseCompletion> get copyWith => _$ExerciseCompletionCopyWithImpl<ExerciseCompletion>(this as ExerciseCompletion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseCompletion&&(identical(other.date, date) || other.date == date)&&(identical(other.maxSets, maxSets) || other.maxSets == maxSets)&&(identical(other.maxReps, maxReps) || other.maxReps == maxReps));
}


@override
int get hashCode => Object.hash(runtimeType,date,maxSets,maxReps);

@override
String toString() {
  return 'ExerciseCompletion(date: $date, maxSets: $maxSets, maxReps: $maxReps)';
}


}

/// @nodoc
abstract mixin class $ExerciseCompletionCopyWith<$Res>  {
  factory $ExerciseCompletionCopyWith(ExerciseCompletion value, $Res Function(ExerciseCompletion) _then) = _$ExerciseCompletionCopyWithImpl;
@useResult
$Res call({
 DateTime date, int maxSets, int maxReps
});




}
/// @nodoc
class _$ExerciseCompletionCopyWithImpl<$Res>
    implements $ExerciseCompletionCopyWith<$Res> {
  _$ExerciseCompletionCopyWithImpl(this._self, this._then);

  final ExerciseCompletion _self;
  final $Res Function(ExerciseCompletion) _then;

/// Create a copy of ExerciseCompletion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? maxSets = null,Object? maxReps = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,maxSets: null == maxSets ? _self.maxSets : maxSets // ignore: cast_nullable_to_non_nullable
as int,maxReps: null == maxReps ? _self.maxReps : maxReps // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseCompletion].
extension ExerciseCompletionPatterns on ExerciseCompletion {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseCompletion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseCompletion() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseCompletion value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseCompletion():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseCompletion value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseCompletion() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int maxSets,  int maxReps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseCompletion() when $default != null:
return $default(_that.date,_that.maxSets,_that.maxReps);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int maxSets,  int maxReps)  $default,) {final _that = this;
switch (_that) {
case _ExerciseCompletion():
return $default(_that.date,_that.maxSets,_that.maxReps);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int maxSets,  int maxReps)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseCompletion() when $default != null:
return $default(_that.date,_that.maxSets,_that.maxReps);case _:
  return null;

}
}

}

/// @nodoc


class _ExerciseCompletion implements ExerciseCompletion {
  const _ExerciseCompletion({required this.date, required this.maxSets, required this.maxReps});
  

@override final  DateTime date;
@override final  int maxSets;
@override final  int maxReps;

/// Create a copy of ExerciseCompletion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseCompletionCopyWith<_ExerciseCompletion> get copyWith => __$ExerciseCompletionCopyWithImpl<_ExerciseCompletion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseCompletion&&(identical(other.date, date) || other.date == date)&&(identical(other.maxSets, maxSets) || other.maxSets == maxSets)&&(identical(other.maxReps, maxReps) || other.maxReps == maxReps));
}


@override
int get hashCode => Object.hash(runtimeType,date,maxSets,maxReps);

@override
String toString() {
  return 'ExerciseCompletion(date: $date, maxSets: $maxSets, maxReps: $maxReps)';
}


}

/// @nodoc
abstract mixin class _$ExerciseCompletionCopyWith<$Res> implements $ExerciseCompletionCopyWith<$Res> {
  factory _$ExerciseCompletionCopyWith(_ExerciseCompletion value, $Res Function(_ExerciseCompletion) _then) = __$ExerciseCompletionCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int maxSets, int maxReps
});




}
/// @nodoc
class __$ExerciseCompletionCopyWithImpl<$Res>
    implements _$ExerciseCompletionCopyWith<$Res> {
  __$ExerciseCompletionCopyWithImpl(this._self, this._then);

  final _ExerciseCompletion _self;
  final $Res Function(_ExerciseCompletion) _then;

/// Create a copy of ExerciseCompletion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? maxSets = null,Object? maxReps = null,}) {
  return _then(_ExerciseCompletion(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,maxSets: null == maxSets ? _self.maxSets : maxSets // ignore: cast_nullable_to_non_nullable
as int,maxReps: null == maxReps ? _self.maxReps : maxReps // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Exercise {

 String get id; String get name; int get sets; int get reps; int get restSeconds; List<ExerciseCompletion> get history;
/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseCopyWith<Exercise> get copyWith => _$ExerciseCopyWithImpl<Exercise>(this as Exercise, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Exercise&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.restSeconds, restSeconds) || other.restSeconds == restSeconds)&&const DeepCollectionEquality().equals(other.history, history));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,sets,reps,restSeconds,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'Exercise(id: $id, name: $name, sets: $sets, reps: $reps, restSeconds: $restSeconds, history: $history)';
}


}

/// @nodoc
abstract mixin class $ExerciseCopyWith<$Res>  {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) _then) = _$ExerciseCopyWithImpl;
@useResult
$Res call({
 String id, String name, int sets, int reps, int restSeconds, List<ExerciseCompletion> history
});




}
/// @nodoc
class _$ExerciseCopyWithImpl<$Res>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._self, this._then);

  final Exercise _self;
  final $Res Function(Exercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sets = null,Object? reps = null,Object? restSeconds = null,Object? history = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,restSeconds: null == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<ExerciseCompletion>,
  ));
}

}


/// Adds pattern-matching-related methods to [Exercise].
extension ExercisePatterns on Exercise {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Exercise value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Exercise value)  $default,){
final _that = this;
switch (_that) {
case _Exercise():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Exercise value)?  $default,){
final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int sets,  int reps,  int restSeconds,  List<ExerciseCompletion> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that.id,_that.name,_that.sets,_that.reps,_that.restSeconds,_that.history);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int sets,  int reps,  int restSeconds,  List<ExerciseCompletion> history)  $default,) {final _that = this;
switch (_that) {
case _Exercise():
return $default(_that.id,_that.name,_that.sets,_that.reps,_that.restSeconds,_that.history);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int sets,  int reps,  int restSeconds,  List<ExerciseCompletion> history)?  $default,) {final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that.id,_that.name,_that.sets,_that.reps,_that.restSeconds,_that.history);case _:
  return null;

}
}

}

/// @nodoc


class _Exercise implements Exercise {
  const _Exercise({required this.id, required this.name, required this.sets, required this.reps, this.restSeconds = 60, final  List<ExerciseCompletion> history = const []}): _history = history;
  

@override final  String id;
@override final  String name;
@override final  int sets;
@override final  int reps;
@override@JsonKey() final  int restSeconds;
 final  List<ExerciseCompletion> _history;
@override@JsonKey() List<ExerciseCompletion> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseCopyWith<_Exercise> get copyWith => __$ExerciseCopyWithImpl<_Exercise>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Exercise&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.restSeconds, restSeconds) || other.restSeconds == restSeconds)&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,sets,reps,restSeconds,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'Exercise(id: $id, name: $name, sets: $sets, reps: $reps, restSeconds: $restSeconds, history: $history)';
}


}

/// @nodoc
abstract mixin class _$ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) _then) = __$ExerciseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int sets, int reps, int restSeconds, List<ExerciseCompletion> history
});




}
/// @nodoc
class __$ExerciseCopyWithImpl<$Res>
    implements _$ExerciseCopyWith<$Res> {
  __$ExerciseCopyWithImpl(this._self, this._then);

  final _Exercise _self;
  final $Res Function(_Exercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sets = null,Object? reps = null,Object? restSeconds = null,Object? history = null,}) {
  return _then(_Exercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,restSeconds: null == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<ExerciseCompletion>,
  ));
}


}

// dart format on
