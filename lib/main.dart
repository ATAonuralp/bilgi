import 'package:flutter/material.dart';

void main() => runApp(bilgitesti());

class bilgitesti extends StatelessWidget {
  const bilgitesti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: sorusayfasi(),
          ),
        ),
      ),
    );
  }
}

class sorusayfasi extends StatefulWidget {
  const sorusayfasi({Key? key}) : super(key: key);

  @override
  State<sorusayfasi> createState() => _sorusayfasiState();
}

class _sorusayfasiState extends State<sorusayfasi> {
  int say = 0;
  void sayi() {
    if (say + 1 <= banka.length) {
      say++;
    }
  }

  List<Widget> secimler = [];

  bool bittimi() {
    if (say + 1 >= banka.length) {
      return true;
    } else {
      return false;
    }
  }

  List<Soru> banka = [
    Soru(
        sorumetni: '1.Titanic gelmiş geçmiş en büyük gemidir',
        soruyaniti: false),
    Soru(
        sorumetni: '2.Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruyaniti: true),
    Soru(sorumetni: '3.Kelebeklerin ömrü bir gündür', soruyaniti: false),
    Soru(
      sorumetni: '4.Dünya düzdür',
      soruyaniti: false,
    ),
    Soru(
        sorumetni: '5.Kaju fıstığı aslında bir meyvenin sapıdır',
        soruyaniti: true),
    Soru(
        sorumetni: '6.Fatih Sultan Mehmet hiç patates yememiştir',
        soruyaniti: true),
    Soru(sorumetni: '7.Fransızlar 80 demek için, 4 - 20 der', soruyaniti: true)
  ];
  void butonfonk(bool secim) {
    if (bittimi() == true) {
    

       showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("TEBRİKLER TESTİ BİTİRDİNİZ"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("BAŞA DÖN"),
              onPressed: () {
                 setState(() {
       secimler = [];
      say = 0;
     }); 
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
      
    } else {
      setState(() {
        if (banka[say].soruyaniti == false) {
          secimler.add(dogruicon);
        } else {
          secimler.add(yanlisicon);
        }
        sayi();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              banka[say].sorumetni.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        )),
        Row(children: secimler),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: RaisedButton(
                    padding: EdgeInsets.all(12),
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Icon(
                      Icons.thumb_down,
                      size: 30.0,
                    ),
                    onPressed: () {
                      butonfonk(true);
                    },
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: RaisedButton(
                  padding: EdgeInsets.all(12),
                  textColor: Colors.white,
                  color: Colors.green[400],
                  child: Icon(
                    Icons.thumb_up,
                    size: 30.0,
                  ),
                  onPressed: () {
                    setState(() {
                      banka[say].soruyaniti == true
                          ? secimler.add(dogruicon)
                          : secimler.add(yanlisicon);
                      sayi();
                    });
                  },
                ),
              ))
            ],
          ),
        ))
      ],
    );
  }
}

const Icon dogruicon = Icon(
  Icons.mood,
  color: Colors.green,
);
const Icon yanlisicon = Icon(
  Icons.mood_bad,
  color: Colors.red,
);

class Soru {
  String? sorumetni;
  bool? soruyaniti;

  Soru({@required this.sorumetni, @required this.soruyaniti});
}
