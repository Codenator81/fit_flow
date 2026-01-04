// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutState()';
}


}

/// @nodoc
class $WorkoutStateCopyWith<$Res>  {
$WorkoutStateCopyWith(WorkoutState _, $Res Function(WorkoutState) __);
}


/// Adds pattern-matching-related methods to [WorkoutState].
extension WorkoutStatePatterns on WorkoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WorkoutInitial value)?  initial,TResult Function( WorkoutLoading value)?  loading,TResult Function( WorkoutLoaded value)?  loaded,TResult Function( WorkoutDetail value)?  detail,TResult Function( WorkoutError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WorkoutInitial() when initial != null:
return initial(_that);case WorkoutLoading() when loading != null:
return loading(_that);case WorkoutLoaded() when loaded != null:
return loaded(_that);case WorkoutDetail() when detail != null:
return detail(_that);case WorkoutError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WorkoutInitial value)  initial,required TResult Function( WorkoutLoading value)  loading,required TResult Function( WorkoutLoaded value)  loaded,required TResult Function( WorkoutDetail value)  detail,required TResult Function( WorkoutError value)  error,}){
final _that = this;
switch (_that) {
case WorkoutInitial():
return initial(_that);case WorkoutLoading():
return loading(_that);case WorkoutLoaded():
return loaded(_that);case WorkoutDetail():
return detail(_that);case WorkoutError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WorkoutInitial value)?  initial,TResult? Function( WorkoutLoading value)?  loading,TResult? Function( WorkoutLoaded value)?  loaded,TResult? Function( WorkoutDetail value)?  detail,TResult? Function( WorkoutError value)?  error,}){
final _that = this;
switch (_that) {
case WorkoutInitial() when initial != null:
return initial(_that);case WorkoutLoading() when loading != null:
return loading(_that);case WorkoutLoaded() when loaded != null:
return loaded(_that);case WorkoutDetail() when detail != null:
return detail(_that);case WorkoutError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Workout> workouts)?  loaded,TResult Function( Workout workout)?  detail,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WorkoutInitial() when initial != null:
return initial();case WorkoutLoading() when loading != null:
return loading();case WorkoutLoaded() when loaded != null:
return loaded(_that.workouts);case WorkoutDetail() when detail != null:
return detail(_that.workout);case WorkoutError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Workout> workouts)  loaded,required TResult Function( Workout workout)  detail,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case WorkoutInitial():
return initial();case WorkoutLoading():
return loading();case WorkoutLoaded():
return loaded(_that.workouts);case WorkoutDetail():
return detail(_that.workout);case WorkoutError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Workout> workouts)?  loaded,TResult? Function( Workout workout)?  detail,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case WorkoutInitial() when initial != null:
return initial();case WorkoutLoading() when loading != null:
return loading();case WorkoutLoaded() when loaded != null:
return loaded(_that.workouts);case WorkoutDetail() when detail != null:
return detail(_that.workout);case WorkoutError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class WorkoutInitial implements WorkoutState {
  const WorkoutInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutState.initial()';
}


}




/// @nodoc


class WorkoutLoading implements WorkoutState {
  const WorkoutLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutState.loading()';
}


}




/// @nodoc


class WorkoutLoaded implements WorkoutState {
  const WorkoutLoaded(final  List<Workout> workouts): _workouts = workouts;
  

 final  List<Workout> _workouts;
 List<Workout> get workouts {
  if (_workouts is EqualUnmodifiableListView) return _workouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workouts);
}


/// Create a copy of WorkoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutLoadedCopyWith<WorkoutLoaded> get copyWith => _$WorkoutLoadedCopyWithImpl<WorkoutLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoaded&&const DeepCollectionEquality().equals(other._workouts, _workouts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_workouts));

@override
String toString() {
  return 'WorkoutState.loaded(workouts: $workouts)';
}


}

/// @nodoc
abstract mixin class $WorkoutLoadedCopyWith<$Res> implements $WorkoutStateCopyWith<$Res> {
  factory $WorkoutLoadedCopyWith(WorkoutLoaded value, $Res Function(WorkoutLoaded) _then) = _$WorkoutLoadedCopyWithImpl;
@useResult
$Res call({
 List<Workout> workouts
});




}
/// @nodoc
class _$WorkoutLoadedCopyWithImpl<$Res>
    implements $WorkoutLoadedCopyWith<$Res> {
  _$WorkoutLoadedCopyWithImpl(this._self, this._then);

  final WorkoutLoaded _self;
  final $Res Function(WorkoutLoaded) _then;

/// Create a copy of WorkoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workouts = null,}) {
  return _then(WorkoutLoaded(
null == workouts ? _self._workouts : workouts // ignore: cast_nullable_to_non_nullable
as List<Workout>,
  ));
}


}

/// @nodoc


class WorkoutDetail implements WorkoutState {
  const WorkoutDetail(this.workout);
  

 final  Workout workout;

/// Create a copy of WorkoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutDetailCopyWith<WorkoutDetail> get copyWith => _$WorkoutDetailCopyWithImpl<WorkoutDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutDetail&&(identical(other.workout, workout) || other.workout == workout));
}


@override
int get hashCode => Object.hash(runtimeType,workout);

@override
String toString() {
  return 'WorkoutState.detail(workout: $workout)';
}


}

/// @nodoc
abstract mixin class $WorkoutDetailCopyWith<$Res> implements $WorkoutStateCopyWith<$Res> {
  factory $WorkoutDetailCopyWith(WorkoutDetail value, $Res Function(WorkoutDetail) _then) = _$WorkoutDetailCopyWithImpl;
@useResult
$Res call({
 Workout workout
});


$WorkoutCopyWith<$Res> get workout;

}
/// @nodoc
class _$WorkoutDetailCopyWithImpl<$Res>
    implements $WorkoutDetailCopyWith<$Res> {
  _$WorkoutDetailCopyWithImpl(this._self, this._then);

  final WorkoutDetail _self;
  final $Res Function(WorkoutDetail) _then;

/// Create a copy of WorkoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workout = null,}) {
  return _then(WorkoutDetail(
null == workout ? _self.workout : workout // ignore: cast_nullable_to_non_nullable
as Workout,
  ));
}

/// Create a copy of WorkoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutCopyWith<$Res> get workout {
  
  return $WorkoutCopyWith<$Res>(_self.workout, (value) {
    return _then(_self.copyWith(workout: value));
  });
}
}

/// @nodoc


class WorkoutError implements WorkoutState {
  const WorkoutError(this.message);
  

 final  String message;

/// Create a copy of WorkoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutErrorCopyWith<WorkoutError> get copyWith => _$WorkoutErrorCopyWithImpl<WorkoutError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WorkoutState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $WorkoutErrorCopyWith<$Res> implements $WorkoutStateCopyWith<$Res> {
  factory $WorkoutErrorCopyWith(WorkoutError value, $Res Function(WorkoutError) _then) = _$WorkoutErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WorkoutErrorCopyWithImpl<$Res>
    implements $WorkoutErrorCopyWith<$Res> {
  _$WorkoutErrorCopyWithImpl(this._self, this._then);

  final WorkoutError _self;
  final $Res Function(WorkoutError) _then;

/// Create a copy of WorkoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WorkoutError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
