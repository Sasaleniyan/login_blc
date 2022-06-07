import 'package:equatable/equatable.dart';

class FormPropsItems extends Equatable {
  const FormPropsItems({
    this.value,
    this.valueIsDirty,
    this.errorMessage,
  });
  final String? value, errorMessage;
  final bool? valueIsDirty;

  factory FormPropsItems.create({String? value}) {
    if (value == null) return const FormPropsItems();
    return FormPropsItems(
      value: value,
      valueIsDirty: value = null,
      errorMessage: null,
    );
  }
  FormPropsItems copyWith(
      String? value, bool? valueIsDirty, String? errorMessage) {
    return FormPropsItems(
      value: value ?? this.value,
      valueIsDirty: valueIsDirty ?? this.valueIsDirty,
      errorMessage: valueIsDirty == true ? errorMessage : this.errorMessage,
    );
  }

  bool get propertyIsValid {
    return valueIsDirty == true && errorMessage == null;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        value,
        valueIsDirty,
        errorMessage,
      ];
}
