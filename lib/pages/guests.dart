import 'package:flutter/widgets.dart';
import 'package:flutter_app_dismissible_ok/data/guest-list.dart';
import 'package:flutter_app_dismissible_ok/models/guest.dart';
import 'package:flutter_app_dismissible_ok/widgets/guest-card.dart';
import 'package:flutter/material.dart';

class GuestsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GuestsPageState();
  }
}

class _GuestsPageState extends State<GuestsPage> {
  final List<Guest> guests = GuestList.getGuests();

  Widget _buildGuestsList() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: guests.length > 0
            ? ListView.builder(
                itemCount: guests.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        guests.removeAt(index);
                      });
                    },
                    background: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 20.0),
                          Icon(
                            Icons.check_circle,
                            size: 40.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      color: Colors.green,
                    ),
                    secondaryBackground: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.warning,
                            size: 40.0,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20.0),
                        ],
                      ),
                      color: Colors.red,
                    ),
                    child: GuestCard(guest: guests[index]),
                    key: UniqueKey(),
                    direction: DismissDirection.horizontal,
                  );
                },
              )
            : Container(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Concluído',
                        textScaleFactor: 2.0,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        child: FlatButton(
                          color: Colors.deepOrange,
                          onPressed: () => print('BOTAO TIRA TEIMA CLICADO'),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'TIRA TEIMA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Público Esperado'),
      ),
      body: _buildGuestsList(),
    );
  }
}
