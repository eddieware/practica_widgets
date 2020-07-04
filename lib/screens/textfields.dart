import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

//https://www.netflix.com/watch/80185236?trackId=155573560
class _InputPageState extends State<InputPage> {
  String _email = '';
  String _nombre = '';
  String _fecha = '';
  String _optSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  // entrada del context en el scaffold ewsta funcion
  // viene por defauld y de ahi lo vas pasando a las demas
  //funciones que lo requieren enviandolo por el constructor
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true, este comanando saca el teclado en automatico
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              //personalizar que tan pronunciados quiero los border
              borderRadius: BorderRadius.circular(20)),
          counter: Text('Letras ${_nombre.length} '),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el Nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),

      onChanged: (valor) {
        print(_nombre);
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              //personalizar que tan pronunciados quiero los border
              borderRadius: BorderRadius.circular(20)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              //personalizar que tan pronunciados quiero los border
              borderRadius: BorderRadius.circular(20)),
          hintText: 'Paswword',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController, //controlador para setear texto
      decoration: InputDecoration(
          border: OutlineInputBorder(
              //personalizar que tan pronunciados quiero los border
              borderRadius: BorderRadius.circular(20)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context); // se crea una funcion enviando el
        //contexto para que flutter sepa en que posicion colocarlo
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
// imprime el nombre en pantalla en modo Binding

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: DropdownButton(
              value: _optSeleccionada,
              items: getOpcionesDropdown(),
              onChanged: (opt) {
                // print(opt);// imprime la opcion seleccionada en el drop down
                setState(() {
                  _optSeleccionada = opt;
                });
              }),
        )
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_optSeleccionada),
    );
  }
}
