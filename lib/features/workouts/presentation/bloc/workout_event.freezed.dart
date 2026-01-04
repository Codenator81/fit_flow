// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutEvent()';
}


}

/// @nodoc
class $WorkoutEventCopyWith<$Res>  {
$WorkoutEventCopyWith(WorkoutEvent _, $Res Function(WorkoutEvent) __);
}


/// Adds pattern-matching-related methods to [WorkoutEvent].
extension WorkoutEventPatterns on WorkoutEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadWorkouts value)?  loadWorkouts,TResult Function( CreateWorkout value)?  createWorkout,TResult Function( DeleteWorkout value)?  deleteWorkout,TResult Function( LoadWorkoutDetail value)?  loadWorkoutDetail,TResult Function( AddDay value)?  addDay,TResult Function( DeleteDay value)?  deleteDay,TResult Function( AddExercise value)?  addExercise,TResult Function( CompleteDay value)?  completeDay,TResult Function( MarkRestDayComplete value)?  markRestDayComplete,TResult Function( ResetWorkout value)?  resetWorkout,TResult Function( SetActiveDay value)?  setActiveDay,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadWorkouts() when loadWorkouts != null:
return loadWorkouts(_that);case CreateWorkout() when createWorkout != null:
return createWorkout(_that);case DeleteWorkout() when deleteWorkout != null:
return deleteWorkout(_that);case LoadWorkoutDetail() when loadWorkoutDetail != null:
return loadWorkoutDetail(_that);case AddDay() when addDay != null:
return addDay(_that);case DeleteDay() when deleteDay != null:
return deleteDay(_that);case AddExercise() when addExercise != null:
return addExercise(_that);case CompleteDay() when completeDay != null:
return completeDay(_that);case MarkRestDayComplete() when markRestDayComplete != null:
return markRestDayComplete(_that);case ResetWorkout() when resetWorkout != null:
return resetWorkout(_that);case SetActiveDay() when setActiveDay != null:
return setActiveDay(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadWorkouts value)  loadWorkouts,required TResult Function( CreateWorkout value)  createWorkout,required TResult Function( DeleteWorkout value)  deleteWorkout,required TResult Function( LoadWorkoutDetail value)  loadWorkoutDetail,required TResult Function( AddDay value)  addDay,required TResult Function( DeleteDay value)  deleteDay,required TResult Function( AddExercise value)  addExercise,required TResult Function( CompleteDay value)  completeDay,required TResult Function( MarkRestDayComplete value)  markRestDayComplete,required TResult Function( ResetWorkout value)  resetWorkout,required TResult Function( SetActiveDay value)  setActiveDay,}){
final _that = this;
switch (_that) {
case LoadWorkouts():
return loadWorkouts(_that);case CreateWorkout():
return createWorkout(_that);case DeleteWorkout():
return deleteWorkout(_that);case LoadWorkoutDetail():
return loadWorkoutDetail(_that);case AddDay():
return addDay(_that);case DeleteDay():
return deleteDay(_that);case AddExercise():
return addExercise(_that);case CompleteDay():
return completeDay(_that);case MarkRestDayComplete():
return markRestDayComplete(_that);case ResetWorkout():
return resetWorkout(_that);case SetActiveDay():
return setActiveDay(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadWorkouts value)?  loadWorkouts,TResult? Function( CreateWorkout value)?  createWorkout,TResult? Function( DeleteWorkout value)?  deleteWorkout,TResult? Function( LoadWorkoutDetail value)?  loadWorkoutDetail,TResult? Function( AddDay value)?  addDay,TResult? Function( DeleteDay value)?  deleteDay,TResult? Function( AddExercise value)?  addExercise,TResult? Function( CompleteDay value)?  completeDay,TResult? Function( MarkRestDayComplete value)?  markRestDayComplete,TResult? Function( ResetWorkout value)?  resetWorkout,TResult? Function( SetActiveDay value)?  setActiveDay,}){
final _that = this;
switch (_that) {
case LoadWorkouts() when loadWorkouts != null:
return loadWorkouts(_that);case CreateWorkout() when createWorkout != null:
return createWorkout(_that);case DeleteWorkout() when deleteWorkout != null:
return deleteWorkout(_that);case LoadWorkoutDetail() when loadWorkoutDetail != null:
return loadWorkoutDetail(_that);case AddDay() when addDay != null:
return addDay(_that);case DeleteDay() when deleteDay != null:
return deleteDay(_that);case AddExercise() when addExercise != null:
return addExercise(_that);case CompleteDay() when completeDay != null:
return completeDay(_that);case MarkRestDayComplete() when markRestDayComplete != null:
return markRestDayComplete(_that);case ResetWorkout() when resetWorkout != null:
return resetWorkout(_that);case SetActiveDay() when setActiveDay != null:
return setActiveDay(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadWorkouts,TResult Function( String name)?  createWorkout,TResult Function( String workoutId)?  deleteWorkout,TResult Function( String workoutId)?  loadWorkoutDetail,TResult Function( String workoutId,  String dayName,  bool isRestDay)?  addDay,TResult Function( String workoutId,  String dayId)?  deleteDay,TResult Function( String workoutId,  String dayId,  String exerciseName,  int sets,  int reps,  int restSeconds)?  addExercise,TResult Function( String workoutId,  String dayId,  Map<String, Map<String, int>> exerciseProgress)?  completeDay,TResult Function( String workoutId,  String dayId)?  markRestDayComplete,TResult Function( String workoutId)?  resetWorkout,TResult Function( String workoutId,  String dayId)?  setActiveDay,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadWorkouts() when loadWorkouts != null:
return loadWorkouts();case CreateWorkout() when createWorkout != null:
return createWorkout(_that.name);case DeleteWorkout() when deleteWorkout != null:
return deleteWorkout(_that.workoutId);case LoadWorkoutDetail() when loadWorkoutDetail != null:
return loadWorkoutDetail(_that.workoutId);case AddDay() when addDay != null:
return addDay(_that.workoutId,_that.dayName,_that.isRestDay);case DeleteDay() when deleteDay != null:
return deleteDay(_that.workoutId,_that.dayId);case AddExercise() when addExercise != null:
return addExercise(_that.workoutId,_that.dayId,_that.exerciseName,_that.sets,_that.reps,_that.restSeconds);case CompleteDay() when completeDay != null:
return completeDay(_that.workoutId,_that.dayId,_that.exerciseProgress);case MarkRestDayComplete() when markRestDayComplete != null:
return markRestDayComplete(_that.workoutId,_that.dayId);case ResetWorkout() when resetWorkout != null:
return resetWorkout(_that.workoutId);case SetActiveDay() when setActiveDay != null:
return setActiveDay(_that.workoutId,_that.dayId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadWorkouts,required TResult Function( String name)  createWorkout,required TResult Function( String workoutId)  deleteWorkout,required TResult Function( String workoutId)  loadWorkoutDetail,required TResult Function( String workoutId,  String dayName,  bool isRestDay)  addDay,required TResult Function( String workoutId,  String dayId)  deleteDay,required TResult Function( String workoutId,  String dayId,  String exerciseName,  int sets,  int reps,  int restSeconds)  addExercise,required TResult Function( String workoutId,  String dayId,  Map<String, Map<String, int>> exerciseProgress)  completeDay,required TResult Function( String workoutId,  String dayId)  markRestDayComplete,required TResult Function( String workoutId)  resetWorkout,required TResult Function( String workoutId,  String dayId)  setActiveDay,}) {final _that = this;
switch (_that) {
case LoadWorkouts():
return loadWorkouts();case CreateWorkout():
return createWorkout(_that.name);case DeleteWorkout():
return deleteWorkout(_that.workoutId);case LoadWorkoutDetail():
return loadWorkoutDetail(_that.workoutId);case AddDay():
return addDay(_that.workoutId,_that.dayName,_that.isRestDay);case DeleteDay():
return deleteDay(_that.workoutId,_that.dayId);case AddExercise():
return addExercise(_that.workoutId,_that.dayId,_that.exerciseName,_that.sets,_that.reps,_that.restSeconds);case CompleteDay():
return completeDay(_that.workoutId,_that.dayId,_that.exerciseProgress);case MarkRestDayComplete():
return markRestDayComplete(_that.workoutId,_that.dayId);case ResetWorkout():
return resetWorkout(_that.workoutId);case SetActiveDay():
return setActiveDay(_that.workoutId,_that.dayId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadWorkouts,TResult? Function( String name)?  createWorkout,TResult? Function( String workoutId)?  deleteWorkout,TResult? Function( String workoutId)?  loadWorkoutDetail,TResult? Function( String workoutId,  String dayName,  bool isRestDay)?  addDay,TResult? Function( String workoutId,  String dayId)?  deleteDay,TResult? Function( String workoutId,  String dayId,  String exerciseName,  int sets,  int reps,  int restSeconds)?  addExercise,TResult? Function( String workoutId,  String dayId,  Map<String, Map<String, int>> exerciseProgress)?  completeDay,TResult? Function( String workoutId,  String dayId)?  markRestDayComplete,TResult? Function( String workoutId)?  resetWorkout,TResult? Function( String workoutId,  String dayId)?  setActiveDay,}) {final _that = this;
switch (_that) {
case LoadWorkouts() when loadWorkouts != null:
return loadWorkouts();case CreateWorkout() when createWorkout != null:
return createWorkout(_that.name);case DeleteWorkout() when deleteWorkout != null:
return deleteWorkout(_that.workoutId);case LoadWorkoutDetail() when loadWorkoutDetail != null:
return loadWorkoutDetail(_that.workoutId);case AddDay() when addDay != null:
return addDay(_that.workoutId,_that.dayName,_that.isRestDay);case DeleteDay() when deleteDay != null:
return deleteDay(_that.workoutId,_that.dayId);case AddExercise() when addExercise != null:
return addExercise(_that.workoutId,_that.dayId,_that.exerciseName,_that.sets,_that.reps,_that.restSeconds);case CompleteDay() when completeDay != null:
return completeDay(_that.workoutId,_that.dayId,_that.exerciseProgress);case MarkRestDayComplete() when markRestDayComplete != null:
return markRestDayComplete(_that.workoutId,_that.dayId);case ResetWorkout() when resetWorkout != null:
return resetWorkout(_that.workoutId);case SetActiveDay() when setActiveDay != null:
return setActiveDay(_that.workoutId,_that.dayId);case _:
  return null;

}
}

}

/// @nodoc


class LoadWorkouts implements WorkoutEvent {
  const LoadWorkouts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadWorkouts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutEvent.loadWorkouts()';
}


}




/// @nodoc


class CreateWorkout implements WorkoutEvent {
  const CreateWorkout(this.name);
  

 final  String name;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWorkoutCopyWith<CreateWorkout> get copyWith => _$CreateWorkoutCopyWithImpl<CreateWorkout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWorkout&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'WorkoutEvent.createWorkout(name: $name)';
}


}

/// @nodoc
abstract mixin class $CreateWorkoutCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $CreateWorkoutCopyWith(CreateWorkout value, $Res Function(CreateWorkout) _then) = _$CreateWorkoutCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$CreateWorkoutCopyWithImpl<$Res>
    implements $CreateWorkoutCopyWith<$Res> {
  _$CreateWorkoutCopyWithImpl(this._self, this._then);

  final CreateWorkout _self;
  final $Res Function(CreateWorkout) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(CreateWorkout(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteWorkout implements WorkoutEvent {
  const DeleteWorkout(this.workoutId);
  

 final  String workoutId;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteWorkoutCopyWith<DeleteWorkout> get copyWith => _$DeleteWorkoutCopyWithImpl<DeleteWorkout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteWorkout&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId);

@override
String toString() {
  return 'WorkoutEvent.deleteWorkout(workoutId: $workoutId)';
}


}

/// @nodoc
abstract mixin class $DeleteWorkoutCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $DeleteWorkoutCopyWith(DeleteWorkout value, $Res Function(DeleteWorkout) _then) = _$DeleteWorkoutCopyWithImpl;
@useResult
$Res call({
 String workoutId
});




}
/// @nodoc
class _$DeleteWorkoutCopyWithImpl<$Res>
    implements $DeleteWorkoutCopyWith<$Res> {
  _$DeleteWorkoutCopyWithImpl(this._self, this._then);

  final DeleteWorkout _self;
  final $Res Function(DeleteWorkout) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,}) {
  return _then(DeleteWorkout(
null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadWorkoutDetail implements WorkoutEvent {
  const LoadWorkoutDetail(this.workoutId);
  

 final  String workoutId;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadWorkoutDetailCopyWith<LoadWorkoutDetail> get copyWith => _$LoadWorkoutDetailCopyWithImpl<LoadWorkoutDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadWorkoutDetail&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId);

@override
String toString() {
  return 'WorkoutEvent.loadWorkoutDetail(workoutId: $workoutId)';
}


}

/// @nodoc
abstract mixin class $LoadWorkoutDetailCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $LoadWorkoutDetailCopyWith(LoadWorkoutDetail value, $Res Function(LoadWorkoutDetail) _then) = _$LoadWorkoutDetailCopyWithImpl;
@useResult
$Res call({
 String workoutId
});




}
/// @nodoc
class _$LoadWorkoutDetailCopyWithImpl<$Res>
    implements $LoadWorkoutDetailCopyWith<$Res> {
  _$LoadWorkoutDetailCopyWithImpl(this._self, this._then);

  final LoadWorkoutDetail _self;
  final $Res Function(LoadWorkoutDetail) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,}) {
  return _then(LoadWorkoutDetail(
null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddDay implements WorkoutEvent {
  const AddDay({required this.workoutId, required this.dayName, required this.isRestDay});
  

 final  String workoutId;
 final  String dayName;
 final  bool isRestDay;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddDayCopyWith<AddDay> get copyWith => _$AddDayCopyWithImpl<AddDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDay&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.isRestDay, isRestDay) || other.isRestDay == isRestDay));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId,dayName,isRestDay);

@override
String toString() {
  return 'WorkoutEvent.addDay(workoutId: $workoutId, dayName: $dayName, isRestDay: $isRestDay)';
}


}

/// @nodoc
abstract mixin class $AddDayCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $AddDayCopyWith(AddDay value, $Res Function(AddDay) _then) = _$AddDayCopyWithImpl;
@useResult
$Res call({
 String workoutId, String dayName, bool isRestDay
});




}
/// @nodoc
class _$AddDayCopyWithImpl<$Res>
    implements $AddDayCopyWith<$Res> {
  _$AddDayCopyWithImpl(this._self, this._then);

  final AddDay _self;
  final $Res Function(AddDay) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,Object? dayName = null,Object? isRestDay = null,}) {
  return _then(AddDay(
workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,isRestDay: null == isRestDay ? _self.isRestDay : isRestDay // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class DeleteDay implements WorkoutEvent {
  const DeleteDay({required this.workoutId, required this.dayId});
  

 final  String workoutId;
 final  String dayId;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteDayCopyWith<DeleteDay> get copyWith => _$DeleteDayCopyWithImpl<DeleteDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteDay&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.dayId, dayId) || other.dayId == dayId));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId,dayId);

@override
String toString() {
  return 'WorkoutEvent.deleteDay(workoutId: $workoutId, dayId: $dayId)';
}


}

/// @nodoc
abstract mixin class $DeleteDayCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $DeleteDayCopyWith(DeleteDay value, $Res Function(DeleteDay) _then) = _$DeleteDayCopyWithImpl;
@useResult
$Res call({
 String workoutId, String dayId
});




}
/// @nodoc
class _$DeleteDayCopyWithImpl<$Res>
    implements $DeleteDayCopyWith<$Res> {
  _$DeleteDayCopyWithImpl(this._self, this._then);

  final DeleteDay _self;
  final $Res Function(DeleteDay) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,Object? dayId = null,}) {
  return _then(DeleteDay(
workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,dayId: null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddExercise implements WorkoutEvent {
  const AddExercise({required this.workoutId, required this.dayId, required this.exerciseName, required this.sets, required this.reps, required this.restSeconds});
  

 final  String workoutId;
 final  String dayId;
 final  String exerciseName;
 final  int sets;
 final  int reps;
 final  int restSeconds;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddExerciseCopyWith<AddExercise> get copyWith => _$AddExerciseCopyWithImpl<AddExercise>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddExercise&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.dayId, dayId) || other.dayId == dayId)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.restSeconds, restSeconds) || other.restSeconds == restSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId,dayId,exerciseName,sets,reps,restSeconds);

@override
String toString() {
  return 'WorkoutEvent.addExercise(workoutId: $workoutId, dayId: $dayId, exerciseName: $exerciseName, sets: $sets, reps: $reps, restSeconds: $restSeconds)';
}


}

/// @nodoc
abstract mixin class $AddExerciseCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $AddExerciseCopyWith(AddExercise value, $Res Function(AddExercise) _then) = _$AddExerciseCopyWithImpl;
@useResult
$Res call({
 String workoutId, String dayId, String exerciseName, int sets, int reps, int restSeconds
});




}
/// @nodoc
class _$AddExerciseCopyWithImpl<$Res>
    implements $AddExerciseCopyWith<$Res> {
  _$AddExerciseCopyWithImpl(this._self, this._then);

  final AddExercise _self;
  final $Res Function(AddExercise) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,Object? dayId = null,Object? exerciseName = null,Object? sets = null,Object? reps = null,Object? restSeconds = null,}) {
  return _then(AddExercise(
workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,dayId: null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,restSeconds: null == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CompleteDay implements WorkoutEvent {
  const CompleteDay({required this.workoutId, required this.dayId, required final  Map<String, Map<String, int>> exerciseProgress}): _exerciseProgress = exerciseProgress;
  

 final  String workoutId;
 final  String dayId;
 final  Map<String, Map<String, int>> _exerciseProgress;
 Map<String, Map<String, int>> get exerciseProgress {
  if (_exerciseProgress is EqualUnmodifiableMapView) return _exerciseProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_exerciseProgress);
}


/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteDayCopyWith<CompleteDay> get copyWith => _$CompleteDayCopyWithImpl<CompleteDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteDay&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.dayId, dayId) || other.dayId == dayId)&&const DeepCollectionEquality().equals(other._exerciseProgress, _exerciseProgress));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId,dayId,const DeepCollectionEquality().hash(_exerciseProgress));

@override
String toString() {
  return 'WorkoutEvent.completeDay(workoutId: $workoutId, dayId: $dayId, exerciseProgress: $exerciseProgress)';
}


}

/// @nodoc
abstract mixin class $CompleteDayCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $CompleteDayCopyWith(CompleteDay value, $Res Function(CompleteDay) _then) = _$CompleteDayCopyWithImpl;
@useResult
$Res call({
 String workoutId, String dayId, Map<String, Map<String, int>> exerciseProgress
});




}
/// @nodoc
class _$CompleteDayCopyWithImpl<$Res>
    implements $CompleteDayCopyWith<$Res> {
  _$CompleteDayCopyWithImpl(this._self, this._then);

  final CompleteDay _self;
  final $Res Function(CompleteDay) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,Object? dayId = null,Object? exerciseProgress = null,}) {
  return _then(CompleteDay(
workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,dayId: null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as String,exerciseProgress: null == exerciseProgress ? _self._exerciseProgress : exerciseProgress // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, int>>,
  ));
}


}

/// @nodoc


class MarkRestDayComplete implements WorkoutEvent {
  const MarkRestDayComplete({required this.workoutId, required this.dayId});
  

 final  String workoutId;
 final  String dayId;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkRestDayCompleteCopyWith<MarkRestDayComplete> get copyWith => _$MarkRestDayCompleteCopyWithImpl<MarkRestDayComplete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkRestDayComplete&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.dayId, dayId) || other.dayId == dayId));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId,dayId);

@override
String toString() {
  return 'WorkoutEvent.markRestDayComplete(workoutId: $workoutId, dayId: $dayId)';
}


}

/// @nodoc
abstract mixin class $MarkRestDayCompleteCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $MarkRestDayCompleteCopyWith(MarkRestDayComplete value, $Res Function(MarkRestDayComplete) _then) = _$MarkRestDayCompleteCopyWithImpl;
@useResult
$Res call({
 String workoutId, String dayId
});




}
/// @nodoc
class _$MarkRestDayCompleteCopyWithImpl<$Res>
    implements $MarkRestDayCompleteCopyWith<$Res> {
  _$MarkRestDayCompleteCopyWithImpl(this._self, this._then);

  final MarkRestDayComplete _self;
  final $Res Function(MarkRestDayComplete) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,Object? dayId = null,}) {
  return _then(MarkRestDayComplete(
workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,dayId: null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResetWorkout implements WorkoutEvent {
  const ResetWorkout(this.workoutId);
  

 final  String workoutId;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetWorkoutCopyWith<ResetWorkout> get copyWith => _$ResetWorkoutCopyWithImpl<ResetWorkout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetWorkout&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId);

@override
String toString() {
  return 'WorkoutEvent.resetWorkout(workoutId: $workoutId)';
}


}

/// @nodoc
abstract mixin class $ResetWorkoutCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $ResetWorkoutCopyWith(ResetWorkout value, $Res Function(ResetWorkout) _then) = _$ResetWorkoutCopyWithImpl;
@useResult
$Res call({
 String workoutId
});




}
/// @nodoc
class _$ResetWorkoutCopyWithImpl<$Res>
    implements $ResetWorkoutCopyWith<$Res> {
  _$ResetWorkoutCopyWithImpl(this._self, this._then);

  final ResetWorkout _self;
  final $Res Function(ResetWorkout) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,}) {
  return _then(ResetWorkout(
null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SetActiveDay implements WorkoutEvent {
  const SetActiveDay({required this.workoutId, required this.dayId});
  

 final  String workoutId;
 final  String dayId;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetActiveDayCopyWith<SetActiveDay> get copyWith => _$SetActiveDayCopyWithImpl<SetActiveDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetActiveDay&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.dayId, dayId) || other.dayId == dayId));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId,dayId);

@override
String toString() {
  return 'WorkoutEvent.setActiveDay(workoutId: $workoutId, dayId: $dayId)';
}


}

/// @nodoc
abstract mixin class $SetActiveDayCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $SetActiveDayCopyWith(SetActiveDay value, $Res Function(SetActiveDay) _then) = _$SetActiveDayCopyWithImpl;
@useResult
$Res call({
 String workoutId, String dayId
});




}
/// @nodoc
class _$SetActiveDayCopyWithImpl<$Res>
    implements $SetActiveDayCopyWith<$Res> {
  _$SetActiveDayCopyWithImpl(this._self, this._then);

  final SetActiveDay _self;
  final $Res Function(SetActiveDay) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,Object? dayId = null,}) {
  return _then(SetActiveDay(
workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,dayId: null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
