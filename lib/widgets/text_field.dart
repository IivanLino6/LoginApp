import 'package:flutter/material.dart';

class DefaultFormField extends StatefulWidget {
  final String txt;
  final Function(String text) onChanged;
  final String error;
  final TextInputType txtType;

  const DefaultFormField(
      {super.key,
      required this.txt,
      required this.onChanged,
      this.error = '',
      this.txtType = TextInputType.text});

  @override
  State<DefaultFormField> createState() => _TextCaptionState();
}

class _TextCaptionState extends State<DefaultFormField> {
  //Crea variable de tipo controlador para acceder a las propiedades del field
  final TextEditingController _txtController = TextEditingController();

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:widget.txtType,
      controller: _txtController,
      decoration: InputDecoration(
          labelText: widget.txt,
          hintText: 'Write your ${widget.txt}',
          enabledBorder: UnderlineInputBorder(
              //Crea una variable para asginar propiedades de decoracion  al TextField
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: UnderlineInputBorder(
              //Crea una variable para asginar propiedades de decoracion  al TextField
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),),
              
      onChanged: (value) {
        widget.onChanged(value);
      },
      onTapOutside: (event) {
        //Cierra el teclado si el usuario presiona afuera
        focusNode.unfocus();
      },
    );
  }
}
