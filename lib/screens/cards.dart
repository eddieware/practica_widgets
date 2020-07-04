import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
          ],
        ));
  }

  _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      //Colum para poder ordenar mas   elementos dentro de esa tarjeta en manera vertical
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo'),
            subtitle: Text(
                'este subtitulo es un ejemplo solo para mostrar algun texto relevante en la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    final card = Container(
      child: Column(children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),

          image:
              NetworkImage('https://jooinn.com/images/perfect-landscape-1.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 300,
          fit: BoxFit.cover, // para cubrir a lo largo y ancho de la tarjeta
        ),
        //  Image(
        //    image: NetworkImage('https://www.publicdomainpictures.net/pictures/30000/velka/evening-landscape-13530956185Aw.jpg') ,
        //  ),
        Container(padding: EdgeInsets.all(10.0), child: Text('Something here'))
      ]),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]
          //color: Colors.red

          ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ), //sirve para cortar cualquier cosa fuera de ese contenedor
    );
  }
}
