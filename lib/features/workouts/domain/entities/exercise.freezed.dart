// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseCompletion {

 DateTime get date; int get maxSets; int get maxReps; double? get maxWeight;
/// Create a copy of ExerciseCompletion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseCompletionCopyWith<ExerciseCompletion> get copyWith => _$ExerciseCompletionCopyWithImpl<ExerciseCompletion>(this as ExerciseCompletion, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ExerciseCompletion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseCompletion&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.maxSets, _this.maxSets) || other.maxSets == _this.maxSets)&&(identical(other.maxReps, _this.maxReps) || other.maxReps == _this.maxReps)&&(identical(other.maxWeight, _this.maxWeight) || other.maxWeight == _this.maxWeight));
}


@override
int get hashCode {
  final _this = this as ExerciseCompletion;
  return Object.hash(runtimeType,_this.date,_this.maxSets,_this.maxReps,_this.maxWeight);
}

@override
String toString() {
  final _this = this as ExerciseCompletion;
  return 'ExerciseCompletion(date: ${_this.date}, maxSets: ${_this.maxSets}, maxReps: ${_this.maxReps}, maxWeight: ${_this.maxWeight})';
}


}

/// @nodoc
abstract mixin class $ExerciseCompletionCopyWith<$Res>  {
  factory $ExerciseCompletionCopyWith(ExerciseCompletion value, $Res Function(ExerciseCompletion) _then) = _$ExerciseCompletionCopyWithImpl;
@useResult
$Res call({
 DateTime date, int maxSets, int maxReps, double? maxWeight
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
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? maxSets = null,Object? maxReps = null,Object? maxWeight = freezed,}) {
  return _then(ExerciseCompletion(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,maxSets: null == maxSets ? _self.maxSets : maxSets // ignore: cast_nullable_to_non_nullable
as int,maxReps: null == maxReps ? _self.maxReps : maxReps // ignore: cast_nullable_to_non_nullable
as int,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int maxSets,  int maxReps,  double? maxWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseCompletion() when $default != null:
return $default(_that.date,_that.maxSets,_that.maxReps,_that.maxWeight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int maxSets,  int maxReps,  double? maxWeight)  $default,) {final _that = this;
switch (_that) {
case _ExerciseCompletion():
return $default(_that.date,_that.maxSets,_that.maxReps,_that.maxWeight);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int maxSets,  int maxReps,  double? maxWeight)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseCompletion() when $default != null:
return $default(_that.date,_that.maxSets,_that.maxReps,_that.maxWeight);case _:
  return null;

}
}

}

/// @nodoc


class _ExerciseCompletion implements ExerciseCompletion {
  const _ExerciseCompletion({required this.date, required this.maxSets, required this.maxReps, this.maxWeight});
  

@override final  DateTime date;
@override final  int maxSets;
@override final  int maxReps;
@override final  double? maxWeight;

/// Create a copy of ExerciseCompletion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseCompletionCopyWith<_ExerciseCompletion> get copyWith => __$ExerciseCompletionCopyWithImpl<_ExerciseCompletion>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseCompletion&&(identical(other.date, date) || other.date == date)&&(identical(other.maxSets, maxSets) || other.maxSets == maxSets)&&(identical(other.maxReps, maxReps) || other.maxReps == maxReps)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,maxSets,maxReps,maxWeight);
}

@override
String toString() {
    return 'ExerciseCompletion(date: $date, maxSets: $maxSets, maxReps: $maxReps, maxWeight: $maxWeight)';
}


}

/// @nodoc
abstract mixin class _$ExerciseCompletionCopyWith<$Res> implements $ExerciseCompletionCopyWith<$Res> {
  factory _$ExerciseCompletionCopyWith(_ExerciseCompletion value, $Res Function(_ExerciseCompletion) _then) = __$ExerciseCompletionCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int maxSets, int maxReps, double? maxWeight
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
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? maxSets = null,Object? maxReps = null,Object? maxWeight = freezed,}) {
  return _then(_ExerciseCompletion(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,maxSets: null == maxSets ? _self.maxSets : maxSets // ignore: cast_nullable_to_non_nullable
as int,maxReps: null == maxReps ? _self.maxReps : maxReps // ignore: cast_nullable_to_non_nullable
as int,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$ExerciseResult {

 int get sets; int get reps; double? get maxWeight; int? get targetSets; int? get targetReps; double? get targetWeight;
/// Create a copy of ExerciseResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseResultCopyWith<ExerciseResult> get copyWith => _$ExerciseResultCopyWithImpl<ExerciseResult>(this as ExerciseResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ExerciseResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseResult&&(identical(other.sets, _this.sets) || other.sets == _this.sets)&&(identical(other.reps, _this.reps) || other.reps == _this.reps)&&(identical(other.maxWeight, _this.maxWeight) || other.maxWeight == _this.maxWeight)&&(identical(other.targetSets, _this.targetSets) || other.targetSets == _this.targetSets)&&(identical(other.targetReps, _this.targetReps) || other.targetReps == _this.targetReps)&&(identical(other.targetWeight, _this.targetWeight) || other.targetWeight == _this.targetWeight));
}


@override
int get hashCode {
  final _this = this as ExerciseResult;
  return Object.hash(runtimeType,_this.sets,_this.reps,_this.maxWeight,_this.targetSets,_this.targetReps,_this.targetWeight);
}

@override
String toString() {
  final _this = this as ExerciseResult;
  return 'ExerciseResult(sets: ${_this.sets}, reps: ${_this.reps}, maxWeight: ${_this.maxWeight}, targetSets: ${_this.targetSets}, targetReps: ${_this.targetReps}, targetWeight: ${_this.targetWeight})';
}


}

/// @nodoc
abstract mixin class $ExerciseResultCopyWith<$Res>  {
  factory $ExerciseResultCopyWith(ExerciseResult value, $Res Function(ExerciseResult) _then) = _$ExerciseResultCopyWithImpl;
@useResult
$Res call({
 int sets, int reps, double? maxWeight, int? targetSets, int? targetReps, double? targetWeight
});




}
/// @nodoc
class _$ExerciseResultCopyWithImpl<$Res>
    implements $ExerciseResultCopyWith<$Res> {
  _$ExerciseResultCopyWithImpl(this._self, this._then);

  final ExerciseResult _self;
  final $Res Function(ExerciseResult) _then;

/// Create a copy of ExerciseResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sets = null,Object? reps = null,Object? maxWeight = freezed,Object? targetSets = freezed,Object? targetReps = freezed,Object? targetWeight = freezed,}) {
  return _then(ExerciseResult(
sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as int?,targetWeight: freezed == targetWeight ? _self.targetWeight : targetWeight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseResult].
extension ExerciseResultPatterns on ExerciseResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseResult value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseResult value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sets,  int reps,  double? maxWeight,  int? targetSets,  int? targetReps,  double? targetWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseResult() when $default != null:
return $default(_that.sets,_that.reps,_that.maxWeight,_that.targetSets,_that.targetReps,_that.targetWeight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sets,  int reps,  double? maxWeight,  int? targetSets,  int? targetReps,  double? targetWeight)  $default,) {final _that = this;
switch (_that) {
case _ExerciseResult():
return $default(_that.sets,_that.reps,_that.maxWeight,_that.targetSets,_that.targetReps,_that.targetWeight);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sets,  int reps,  double? maxWeight,  int? targetSets,  int? targetReps,  double? targetWeight)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseResult() when $default != null:
return $default(_that.sets,_that.reps,_that.maxWeight,_that.targetSets,_that.targetReps,_that.targetWeight);case _:
  return null;

}
}

}

/// @nodoc


class _ExerciseResult implements ExerciseResult {
  const _ExerciseResult({required this.sets, required this.reps, this.maxWeight, this.targetSets, this.targetReps, this.targetWeight});
  

@override final  int sets;
@override final  int reps;
@override final  double? maxWeight;
@override final  int? targetSets;
@override final  int? targetReps;
@override final  double? targetWeight;

/// Create a copy of ExerciseResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseResultCopyWith<_ExerciseResult> get copyWith => __$ExerciseResultCopyWithImpl<_ExerciseResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseResult&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.targetWeight, targetWeight) || other.targetWeight == targetWeight));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sets,reps,maxWeight,targetSets,targetReps,targetWeight);
}

@override
String toString() {
    return 'ExerciseResult(sets: $sets, reps: $reps, maxWeight: $maxWeight, targetSets: $targetSets, targetReps: $targetReps, targetWeight: $targetWeight)';
}


}

/// @nodoc
abstract mixin class _$ExerciseResultCopyWith<$Res> implements $ExerciseResultCopyWith<$Res> {
  factory _$ExerciseResultCopyWith(_ExerciseResult value, $Res Function(_ExerciseResult) _then) = __$ExerciseResultCopyWithImpl;
@override @useResult
$Res call({
 int sets, int reps, double? maxWeight, int? targetSets, int? targetReps, double? targetWeight
});




}
/// @nodoc
class __$ExerciseResultCopyWithImpl<$Res>
    implements _$ExerciseResultCopyWith<$Res> {
  __$ExerciseResultCopyWithImpl(this._self, this._then);

  final _ExerciseResult _self;
  final $Res Function(_ExerciseResult) _then;

/// Create a copy of ExerciseResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sets = null,Object? reps = null,Object? maxWeight = freezed,Object? targetSets = freezed,Object? targetReps = freezed,Object? targetWeight = freezed,}) {
  return _then(_ExerciseResult(
sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as int?,targetWeight: freezed == targetWeight ? _self.targetWeight : targetWeight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$Exercise {

 String get id; String get name; int get sets; int get reps; bool get tracksWeight; double? get targetWeight; List<ExerciseCompletion> get history;
/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseCopyWith<Exercise> get copyWith => _$ExerciseCopyWithImpl<Exercise>(this as Exercise, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Exercise;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Exercise&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.sets, _this.sets) || other.sets == _this.sets)&&(identical(other.reps, _this.reps) || other.reps == _this.reps)&&(identical(other.tracksWeight, _this.tracksWeight) || other.tracksWeight == _this.tracksWeight)&&(identical(other.targetWeight, _this.targetWeight) || other.targetWeight == _this.targetWeight)&&const DeepCollectionEquality().equals(other.history, _this.history));
}


@override
int get hashCode {
  final _this = this as Exercise;
  return Object.hash(runtimeType,_this.id,_this.name,_this.sets,_this.reps,_this.tracksWeight,_this.targetWeight,const DeepCollectionEquality().hash(_this.history));
}

@override
String toString() {
  final _this = this as Exercise;
  return 'Exercise(id: ${_this.id}, name: ${_this.name}, sets: ${_this.sets}, reps: ${_this.reps}, tracksWeight: ${_this.tracksWeight}, targetWeight: ${_this.targetWeight}, history: ${_this.history})';
}


}

/// @nodoc
abstract mixin class $ExerciseCopyWith<$Res>  {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) _then) = _$ExerciseCopyWithImpl;
@useResult
$Res call({
 String id, String name, int sets, int reps, bool tracksWeight, double? targetWeight, List<ExerciseCompletion> history
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sets = null,Object? reps = null,Object? tracksWeight = null,Object? targetWeight = freezed,Object? history = null,}) {
  return _then(Exercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,tracksWeight: null == tracksWeight ? _self.tracksWeight : tracksWeight // ignore: cast_nullable_to_non_nullable
as bool,targetWeight: freezed == targetWeight ? _self.targetWeight : targetWeight // ignore: cast_nullable_to_non_nullable
as double?,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int sets,  int reps,  bool tracksWeight,  double? targetWeight,  List<ExerciseCompletion> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that.id,_that.name,_that.sets,_that.reps,_that.tracksWeight,_that.targetWeight,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int sets,  int reps,  bool tracksWeight,  double? targetWeight,  List<ExerciseCompletion> history)  $default,) {final _that = this;
switch (_that) {
case _Exercise():
return $default(_that.id,_that.name,_that.sets,_that.reps,_that.tracksWeight,_that.targetWeight,_that.history);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int sets,  int reps,  bool tracksWeight,  double? targetWeight,  List<ExerciseCompletion> history)?  $default,) {final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that.id,_that.name,_that.sets,_that.reps,_that.tracksWeight,_that.targetWeight,_that.history);case _:
  return null;

}
}

}

/// @nodoc


class _Exercise implements Exercise {
  const _Exercise({required this.id, required this.name, required this.sets, required this.reps, this.tracksWeight = false, this.targetWeight,  List<ExerciseCompletion> history = const []}): _history = history;
  

@override final  String id;
@override final  String name;
@override final  int sets;
@override final  int reps;
@override@JsonKey() final  bool tracksWeight;
@override final  double? targetWeight;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Exercise&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.tracksWeight, tracksWeight) || other.tracksWeight == tracksWeight)&&(identical(other.targetWeight, targetWeight) || other.targetWeight == targetWeight)&&const DeepCollectionEquality().equals(other.history, _history));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,sets,reps,tracksWeight,targetWeight,const DeepCollectionEquality().hash(_history));
}

@override
String toString() {
    return 'Exercise(id: $id, name: $name, sets: $sets, reps: $reps, tracksWeight: $tracksWeight, targetWeight: $targetWeight, history: $history)';
}


}

/// @nodoc
abstract mixin class _$ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) _then) = __$ExerciseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int sets, int reps, bool tracksWeight, double? targetWeight, List<ExerciseCompletion> history
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sets = null,Object? reps = null,Object? tracksWeight = null,Object? targetWeight = freezed,Object? history = null,}) {
  return _then(_Exercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,tracksWeight: null == tracksWeight ? _self.tracksWeight : tracksWeight // ignore: cast_nullable_to_non_nullable
as bool,targetWeight: freezed == targetWeight ? _self.targetWeight : targetWeight // ignore: cast_nullable_to_non_nullable
as double?,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<ExerciseCompletion>,
  ));
}


}

// dart format on
