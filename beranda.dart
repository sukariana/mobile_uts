import "package:flutter/material.dart";
import "About.dart";

void main() {
  runApp(MaterialApp(
    title: 'Kalkulator Investasi',
    home: SIForm(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.blueAccent),
  ));
}
class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}
class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();

  var _currencies = ['Rupiah', 'Dollar', 'Pound'];
  final _minimumPadding = 5.0;
  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }
  TextEditingController uang= TextEditingController();
  TextEditingController bunga = TextEditingController();
  TextEditingController waktu = TextEditingController();
  var _currentItemSelected = '';
  @override
  Widget build(BuildContext context) {


    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
//      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text("Kalkulator Investasi"),
          actions: <Widget>[
            IconButton(
                icon:const Icon(Icons.account_box),
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => About()));

                }
            )
          ]
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              getImageAsset(),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: uang,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'silahkan di isi!';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Masukkan Nominal',
                      hintText: 'Contoh 10000',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 15.0,
                      ),
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: bunga,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'silahkan di isi!';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Besar Bunga',
                      hintText: 'Dalam Persen angka',
                      labelStyle: textStyle,
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: waktu,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'silahkan isi';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Jangka Waktu',
                            hintText: 'Tahun e.x 2020',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 15.0,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currentItemSelected,
                        onChanged: (String newValueSelected) {
                          _onDropDownItemSelected(newValueSelected);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Colors.white,
                          child: Text(
                            "Hitung",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                this.displayResult = _calculateTotalReturns();
                              }
                            });
                          }),
                    ),
                    Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Colors.white,
                          child: Text(
                            "Kembali",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Text(
                  this.displayResult,
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onDropDownItemSelected(newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  var displayResult = '';
  String _calculateTotalReturns() {
    double jumlahuang = double.parse(uang.text);
    double besarbunga = double.parse(bunga.text);
    double kurunwaktu = double.parse(waktu.text);

    double totalAmountPayable = jumlahuang+(jumlahuang*besarbunga*kurunwaktu)/ 100;

    String result =
        'dalam kurun waktu Tahun $kurunwaktu,Anda mendapat investasi sebesar $totalAmountPayable $_currentItemSelected';

    return result;
  }

  void _reset() {
    uang.text = '';
    bunga.text = '';
    waktu.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}