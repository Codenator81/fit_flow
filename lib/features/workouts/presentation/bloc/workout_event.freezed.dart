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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadWorkouts value)?  loadWorkouts,TResult Function( CreateWorkout value)?  createWorkout,TResult Function( DeleteWorkout value)?  deleteWorkout,TResult Function( LoadWorkoutDetail value)?  loadWorkoutDetail,TResult Function( AddDay value)?  addDay,TResult Function( AddExercise value)?  addExercise,TResult Function( UpdateExerciseProgress value)?  updateExerciseProgress,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadWorkouts() when loadWorkouts != null:
return loadWorkouts(_that);case CreateWorkout() when createWorkout != null:
return createWorkout(_that);case DeleteWorkout() when deleteWorkout != null:
return deleteWorkout(_that);case LoadWorkoutDetail() when loadWorkoutDetail != null:
return loadWorkoutDetail(_that);case AddDay() when addDay != null:
return addDay(_that);case AddExercise() when addExercise != null:
return addExercise(_that);case UpdateExerciseProgress() when updateExerciseProgress != null:
return updateExerciseProgress(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadWorkouts value)  loadWorkouts,required TResult Function( CreateWorkout value)  createWorkout,required TResult Function( DeleteWorkout value)  deleteWorkout,required TResult Function( LoadWorkoutDetail value)  loadWorkoutDetail,required TResult Function( AddDay value)  addDay,required TResult Function( AddExercise value)  addExercise,required TResult Function( UpdateExerciseProgress value)  updateExerciseProgress,}){
final _that = this;
switch (_that) {
case LoadWorkouts():
return loadWorkouts(_that);case CreateWorkout():
return createWorkout(_that);case DeleteWorkout():
return deleteWorkout(_that);case LoadWorkoutDetail():
return loadWorkoutDetail(_that);case AddDay():
return addDay(_that);case AddExercise():
return addExercise(_that);case UpdateExerciseProgress():
return updateExerciseProgress(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadWorkouts value)?  loadWorkouts,TResult? Function( CreateWorkout value)?  createWorkout,TResult? Function( DeleteWorkout value)?  deleteWorkout,TResult? Function( LoadWorkoutDetail value)?  loadWorkoutDetail,TResult? Function( AddDay value)?  addDay,TResult? Function( AddExercise value)?  addExercise,TResult? Function( UpdateExerciseProgress value)?  updateExerciseProgress,}){
final _that = this;
switch (_that) {
case LoadWorkouts() when loadWorkouts != null:
return loadWorkouts(_that);case CreateWorkout() when createWorkout != null:
return createWorkout(_that);case DeleteWorkout() when deleteWorkout != null:
return deleteWorkout(_that);case LoadWorkoutDetail() when loadWorkoutDetail != null:
return loadWorkoutDetail(_that);case AddDay() when addDay != null:
return addDay(_that);case AddExercise() when addExercise != null:
return addExercise(_that);case UpdateExerciseProgress() when updateExerciseProgress != null:
return updateExerciseProgress(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadWorkouts,TResult Function( String name)?  createWorkout,TResult Function( String workoutId)?  deleteWorkout,TResult Function( String workoutId)?  loadWorkoutDetail,TResult Function( String workoutId,  String dayName)?  addDay,TResult Function( String workoutId,  String dayId,  String exerciseName,  int sets,  int reps)?  addExercise,TResult Function( String workoutId,  String dayId,  String exerciseId,  int completedSets,  int completedReps)?  updateExerciseProgress,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadWorkouts() when loadWorkouts != null:
return loadWorkouts();case CreateWorkout() when createWorkout != null:
return createWorkout(_that.name);case DeleteWorkout() when deleteWorkout != null:
return deleteWorkout(_that.workoutId);case LoadWorkoutDetail() when loadWorkoutDetail != null:
return loadWorkoutDetail(_that.workoutId);case AddDay() when addDay != null:
return addDay(_that.workoutId,_that.dayName);case AddExercise() when addExercise != null:
return addExercise(_that.workoutId,_that.dayId,_that.exerciseName,_that.sets,_that.reps);case UpdateExerciseProgress() when updateExerciseProgress != null:
return updateExerciseProgress(_that.workoutId,_that.dayId,_that.exerciseId,_that.completedSets,_that.completedReps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadWorkouts,required TResult Function( String name)  createWorkout,required TResult Function( String workoutId)  deleteWorkout,required TResult Function( String workoutId)  loadWorkoutDetail,required TResult Function( String workoutId,  String dayName)  addDay,required TResult Function( String workoutId,  String dayId,  String exerciseName,  int sets,  int reps)  addExercise,required TResult Function( String workoutId,  String dayId,  String exerciseId,  int completedSets,  int completedReps)  updateExerciseProgress,}) {final _that = this;
switch (_that) {
case LoadWorkouts():
return loadWorkouts();case CreateWorkout():
return createWorkout(_that.name);case DeleteWorkout():
return deleteWorkout(_that.workoutId);case LoadWorkoutDetail():
return loadWorkoutDetail(_that.workoutId);case AddDay():
return addDay(_that.workoutId,_that.dayName);case AddExercise():
return addExercise(_that.workoutId,_that.dayId,_that.exerciseName,_that.sets,_that.reps);case UpdateExerciseProgress():
return updateExerciseProgress(_that.workoutId,_that.dayId,_that.exerciseId,_that.completedSets,_that.completedReps);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadWorkouts,TResult? Function( String name)?  createWorkout,TResult? Function( String workoutId)?  deleteWorkout,TResult? Function( String workoutId)?  loadWorkoutDetail,TResult? Function( String workoutId,  String dayName)?  addDay,TResult? Function( String workoutId,  String dayId,  String exerciseName,  int sets,  int reps)?  addExercise,TResult? Function( String workoutId,  String dayId,  String exerciseId,  int completedSets,  int completedReps)?  updateExerciseProgress,}) {final _that = this;
switch (_that) {
case LoadWorkouts() when loadWorkouts != null:
return loadWorkouts();case CreateWorkout() when createWorkout != null:
return createWorkout(_that.name);case DeleteWorkout() when deleteWorkout != null:
return deleteWorkout(_that.workoutId);case LoadWorkoutDetail() when loadWorkoutDetail != null:
return loadWorkoutDetail(_that.workoutId);case AddDay() when addDay != null:
return addDay(_that.workoutId,_that.dayName);case AddExercise() when addExercise != null:
return addExercise(_that.workoutId,_that.dayId,_that.exerciseName,_that.sets,_that.reps);case UpdateExerciseProgress() when updateExerciseProgress != null:
return updateExerciseProgress(_that.workoutId,_that.dayId,_that.exerciseId,_that.completedSets,_that.completedReps);case _:
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
  const AddDay({required this.workoutId, required this.dayName});
  

 final  String workoutId;
 final  String dayName;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddDayCopyWith<AddDay> get copyWith => _$AddDayCopyWithImpl<AddDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDay&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.dayName, dayName) || other.dayName == dayName));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId,dayName);

@override
String toString() {
  return 'WorkoutEvent.addDay(workoutId: $workoutId, dayName: $dayName)';
}


}

/// @nodoc
abstract mixin class $AddDayCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $AddDayCopyWith(AddDay value, $Res Function(AddDay) _then) = _$AddDayCopyWithImpl;
@useResult
$Res call({
 String workoutId, String dayName
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
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,Object? dayName = null,}) {
  return _then(AddDay(
workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddExercise implements WorkoutEvent {
  const AddExercise({required this.workoutId, required this.dayId, required this.exerciseName, required this.sets, required this.reps});
  

 final  String workoutId;
 final  String dayId;
 final  String exerciseName;
 final  int sets;
 final  int reps;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddExerciseCopyWith<AddExercise> get copyWith => _$AddExerciseCopyWithImpl<AddExercise>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddExercise&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.dayId, dayId) || other.dayId == dayId)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.reps, reps) || other.reps == reps));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId,dayId,exerciseName,sets,reps);

@override
String toString() {
  return 'WorkoutEvent.addExercise(workoutId: $workoutId, dayId: $dayId, exerciseName: $exerciseName, sets: $sets, reps: $reps)';
}


}

/// @nodoc
abstract mixin class $AddExerciseCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $AddExerciseCopyWith(AddExercise value, $Res Function(AddExercise) _then) = _$AddExerciseCopyWithImpl;
@useResult
$Res call({
 String workoutId, String dayId, String exerciseName, int sets, int reps
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
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,Object? dayId = null,Object? exerciseName = null,Object? sets = null,Object? reps = null,}) {
  return _then(AddExercise(
workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,dayId: null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UpdateExerciseProgress implements WorkoutEvent {
  const UpdateExerciseProgress({required this.workoutId, required this.dayId, required this.exerciseId, required this.completedSets, required this.completedReps});
  

 final  String workoutId;
 final  String dayId;
 final  String exerciseId;
 final  int completedSets;
 final  int completedReps;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateExerciseProgressCopyWith<UpdateExerciseProgress> get copyWith => _$UpdateExerciseProgressCopyWithImpl<UpdateExerciseProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateExerciseProgress&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.dayId, dayId) || other.dayId == dayId)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.completedSets, completedSets) || other.completedSets == completedSets)&&(identical(other.completedReps, completedReps) || other.completedReps == completedReps));
}


@override
int get hashCode => Object.hash(runtimeType,workoutId,dayId,exerciseId,completedSets,completedReps);

@override
String toString() {
  return 'WorkoutEvent.updateExerciseProgress(workoutId: $workoutId, dayId: $dayId, exerciseId: $exerciseId, completedSets: $completedSets, completedReps: $completedReps)';
}


}

/// @nodoc
abstract mixin class $UpdateExerciseProgressCopyWith<$Res> implements $WorkoutEventCopyWith<$Res> {
  factory $UpdateExerciseProgressCopyWith(UpdateExerciseProgress value, $Res Function(UpdateExerciseProgress) _then) = _$UpdateExerciseProgressCopyWithImpl;
@useResult
$Res call({
 String workoutId, String dayId, String exerciseId, int completedSets, int completedReps
});




}
/// @nodoc
class _$UpdateExerciseProgressCopyWithImpl<$Res>
    implements $UpdateExerciseProgressCopyWith<$Res> {
  _$UpdateExerciseProgressCopyWithImpl(this._self, this._then);

  final UpdateExerciseProgress _self;
  final $Res Function(UpdateExerciseProgress) _then;

/// Create a copy of WorkoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workoutId = null,Object? dayId = null,Object? exerciseId = null,Object? completedSets = null,Object? completedReps = null,}) {
  return _then(UpdateExerciseProgress(
workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,dayId: null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,completedSets: null == completedSets ? _self.completedSets : completedSets // ignore: cast_nullable_to_non_nullable
as int,completedReps: null == completedReps ? _self.completedReps : completedReps // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
