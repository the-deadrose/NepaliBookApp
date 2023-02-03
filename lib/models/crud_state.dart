




class CrudState{
  final String errorMessage;
  final bool isSuccess;
  final bool isLoad;

  CrudState({
    required this.errorMessage,
    required this.isLoad,
    required this.isSuccess

  });


  CrudState copyWith({bool? isLoad, String? errorMessage, bool? isSuccess }){
    return CrudState(
        errorMessage: errorMessage ?? this.errorMessage,
        isLoad: isLoad ?? this.isLoad,
        isSuccess: isSuccess ?? this.isSuccess
    );
  }

  factory CrudState.empty(){
    return CrudState(errorMessage: '', isLoad: false, isSuccess: false);
  }

}