class BlocFormItem {
  final String value;
  final String? error;

  const BlocFormItem({this.error, this.value = ''});

  BlocFormItem copyWith({String? value, String? error}) {
    return BlocFormItem(value: value ?? this.value, error: error ?? this.error);
  }
}
