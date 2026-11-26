// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutDay {

 String get id; String get name; int get dayNumber; List<Exercise> get exercises; bool get isRestDay; bool get isCompleted; bool get isActive; DateTime? get completedDate;
/// Create a copy of WorkoutDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutDayCopyWith<WorkoutDay> get copyWith => _$WorkoutDayCopyWithImpl<WorkoutDay>(this as WorkoutDay, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WorkoutDay;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutDay&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.dayNumber, _this.dayNumber) || other.dayNumber == _this.dayNumber)&&const DeepCollectionEquality().equals(other.exercises, _this.exercises)&&(identical(other.isRestDay, _this.isRestDay) || other.isRestDay == _this.isRestDay)&&(identical(other.isCompleted, _this.isCompleted) || other.isCompleted == _this.isCompleted)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.completedDate, _this.completedDate) || other.completedDate == _this.completedDate));
}


@override
int get hashCode {
  final _this = this as WorkoutDay;
  return Object.hash(runtimeType,_this.id,_this.name,_this.dayNumber,const DeepCollectionEquality().hash(_this.exercises),_this.isRestDay,_this.isCompleted,_this.isActive,_this.completedDate);
}

@override
String toString() {
  final _this = this as WorkoutDay;
  return 'WorkoutDay(id: ${_this.id}, name: ${_this.name}, dayNumber: ${_this.dayNumber}, exercises: ${_this.exercises}, isRestDay: ${_this.isRestDay}, isCompleted: ${_this.isCompleted}, isActive: ${_this.isActive}, completedDate: ${_this.completedDate})';
}


}

/// @nodoc
abstract mixin class $WorkoutDayCopyWith<$Res>  {
  factory $WorkoutDayCopyWith(WorkoutDay value, $Res Function(WorkoutDay) _then) = _$WorkoutDayCopyWithImpl;
@useResult
$Res call({
 String id, String name, int dayNumber, List<Exercise> exercises, bool isRestDay, bool isCompleted, bool isActive, DateTime? completedDate
});




}
/// @nodoc
class _$WorkoutDayCopyWithImpl<$Res>
    implements $WorkoutDayCopyWith<$Res> {
  _$WorkoutDayCopyWithImpl(this._self, this._then);

  final WorkoutDay _self;
  final $Res Function(WorkoutDay) _then;

/// Create a copy of WorkoutDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? dayNumber = null,Object? exercises = null,Object? isRestDay = null,Object? isCompleted = null,Object? isActive = null,Object? completedDate = freezed,}) {
  return _then(WorkoutDay(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<Exercise>,isRestDay: null == isRestDay ? _self.isRestDay : isRestDay // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,completedDate: freezed == completedDate ? _self.completedDate : completedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutDay].
extension WorkoutDayPatterns on WorkoutDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutDay value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutDay value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int dayNumber,  List<Exercise> exercises,  bool isRestDay,  bool isCompleted,  bool isActive,  DateTime? completedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutDay() when $default != null:
return $default(_that.id,_that.name,_that.dayNumber,_that.exercises,_that.isRestDay,_that.isCompleted,_that.isActive,_that.completedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int dayNumber,  List<Exercise> exercises,  bool isRestDay,  bool isCompleted,  bool isActive,  DateTime? completedDate)  $default,) {final _that = this;
switch (_that) {
case _WorkoutDay():
return $default(_that.id,_that.name,_that.dayNumber,_that.exercises,_that.isRestDay,_that.isCompleted,_that.isActive,_that.completedDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int dayNumber,  List<Exercise> exercises,  bool isRestDay,  bool isCompleted,  bool isActive,  DateTime? completedDate)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutDay() when $default != null:
return $default(_that.id,_that.name,_that.dayNumber,_that.exercises,_that.isRestDay,_that.isCompleted,_that.isActive,_that.completedDate);case _:
  return null;

}
}

}

/// @nodoc


class _WorkoutDay implements WorkoutDay {
  const _WorkoutDay({required this.id, required this.name, required this.dayNumber, required  List<Exercise> exercises, this.isRestDay = false, this.isCompleted = false, this.isActive = false, this.completedDate}): _exercises = exercises;
  

@override final  String id;
@override final  String name;
@override final  int dayNumber;
 final  List<Exercise> _exercises;
@override List<Exercise> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}

@override@JsonKey() final  bool isRestDay;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  bool isActive;
@override final  DateTime? completedDate;

/// Create a copy of WorkoutDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutDayCopyWith<_WorkoutDay> get copyWith => __$WorkoutDayCopyWithImpl<_WorkoutDay>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutDay&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&const DeepCollectionEquality().equals(other.exercises, _exercises)&&(identical(other.isRestDay, isRestDay) || other.isRestDay == isRestDay)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.completedDate, completedDate) || other.completedDate == completedDate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,dayNumber,const DeepCollectionEquality().hash(_exercises),isRestDay,isCompleted,isActive,completedDate);
}

@override
String toString() {
    return 'WorkoutDay(id: $id, name: $name, dayNumber: $dayNumber, exercises: $exercises, isRestDay: $isRestDay, isCompleted: $isCompleted, isActive: $isActive, completedDate: $completedDate)';
}


}

/// @nodoc
abstract mixin class _$WorkoutDayCopyWith<$Res> implements $WorkoutDayCopyWith<$Res> {
  factory _$WorkoutDayCopyWith(_WorkoutDay value, $Res Function(_WorkoutDay) _then) = __$WorkoutDayCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int dayNumber, List<Exercise> exercises, bool isRestDay, bool isCompleted, bool isActive, DateTime? completedDate
});




}
/// @nodoc
class __$WorkoutDayCopyWithImpl<$Res>
    implements _$WorkoutDayCopyWith<$Res> {
  __$WorkoutDayCopyWithImpl(this._self, this._then);

  final _WorkoutDay _self;
  final $Res Function(_WorkoutDay) _then;

/// Create a copy of WorkoutDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? dayNumber = null,Object? exercises = null,Object? isRestDay = null,Object? isCompleted = null,Object? isActive = null,Object? completedDate = freezed,}) {
  return _then(_WorkoutDay(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<Exercise>,isRestDay: null == isRestDay ? _self.isRestDay : isRestDay // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,completedDate: freezed == completedDate ? _self.completedDate : completedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
