import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/Utility/shared_preferences_util.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceSubGroupModel/CitizenServiceSubGroup_MainBloc.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenserviceList.dart';
import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
import 'package:navigationdrawer/fragments/CommonService/Loading.dart';


class Citizenfragment extends StatefulWidget {
  final String id;
  Citizenfragment(this.id, {Key key}) : super(key: key);
  @override
  _CitizenfragmentState createState() => _CitizenfragmentState();
}

@override
State<StatefulWidget> createState() {
  return null;
}

class _CitizenfragmentState extends State<Citizenfragment> {
  CitizenServiceSubGroupMainBloc _subgroupbloc;

  @override
  void initState() {
    super.initState();
    PreferenceUtils.init();
    _subgroupbloc = CitizenServiceSubGroupMainBloc(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _apptitle(widget.id),
      body: RefreshIndicator(
          onRefresh: () => _subgroupbloc.fetchSubGroup(widget.id),
          child: StreamBuilder<ApiResponse<BaseServiceModel>>(
              stream: _subgroupbloc.citizenserviceSubGroupStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case ApiStatus.Loading:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case ApiStatus.Completed:
                      return CitizenserverMaingroup(
                        availablelist: snapshot.data.data,
                      );
                      break;
                    case ApiStatus.Error:
                      return ErrorMessage(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () =>
                            _subgroupbloc.fetchSubGroup(widget.id),
                      );
                      break;
                  }
                }
                return Container();
              })),
    );
  }

  _apptitle(String obj) {
    if (widget.id == '%27SER_UBMNT%27') {
      return AppBar(title: Text("Citizen Service-Urban"));
    } else {
      return AppBar(title: Text("Citizen Service-Rural"));
    }
  }
}

class CitizenserverMaingroup extends StatefulWidget {
  BaseServiceModel availablelist;

  CitizenserverMaingroup({Key key, this.availablelist}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CitizenserverMaingroupState();
  }
}

class CitizenserverMaingroupState extends State<CitizenserverMaingroup> {
  bool isButtonPressed = false;
  bool viewVisible = true;
  String mainServID;
  String serviceArea;

  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    PreferenceUtils.init();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Column(children: <Widget>[
          new Container(
              padding: EdgeInsetsDirectional.only(start: 0, end: 0, top: 20.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[])),
          Container(
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.green,
                elevation: 10,
                child: new ListTile(
                  leading: new Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  title: new TextField(
                    cursorColor: Colors.white70,
                    style: TextStyle(color: Colors.white),
                    controller: controller,
                    decoration: new InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        hintText: 'Search',
                        border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(
                    icon: new Icon(
                      Icons.cancel,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      _userDetails.clear();
                      _searchResult.clear();
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
              child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Citizen Category",
                      style: TextStyle(
                          color: Colors.black87,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)))),
          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                          onTap: () =>
                              _selectedItem(_searchResult[i].toString()),
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: new ListTile(
                                trailing: Icon(Icons.navigate_next,
                                    color: Colors.white70, size: 30.0),
                                title: new Text(_searchResult[i].toString()
                                , style: TextStyle(
                                        color: Colors.black87,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                              ),
                            ),
                          );
                    },
                  )
                : new ListView.builder(
                    itemCount: widget.availablelist.d.results.length,
                    itemBuilder: (context, index) {
                      String activityDesc = widget
                          .availablelist.d.results[index].subgroupDec
                          .toString();
                      String subgroupid =
                          widget.availablelist.d.results[index].subgroupID;
                      String result = activityDesc[0].toUpperCase() +
                          activityDesc.substring(1).toLowerCase();
                          
                      if (result != null) {
                        _userDetails.add(result);
                      }
                      print(result);
                      return GestureDetector(
                        onTap: () => _selectedItem(subgroupid),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: new ListTile(
                                trailing: Icon(Icons.navigate_next,
                                    color: Colors.black87, size: 20.0),
                                title: new Text(result,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ]));
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {
        _userDetails.clear();
        _searchResult.clear();
      });
      return;
    }
    setState(() {
      _searchResult.clear();
      for (int i = 0; i < _userDetails.length; i++) {
        if (_userDetails[i].contains(text)) {
          print(_userDetails[i].toString());
          _searchResult.add(_userDetails[i].toString());
        }
      }
    });
  }

  List<String> _searchResult = [];
  List<String> _userDetails = [];

  _selectedItem(String sungroupid) {
    // setState(() async {
    // SharedPreferences sharedPreferences =
    //     await SharedPreferences.getInstance();
    mainServID = PreferenceUtils.getString(Preferences.mainServID);
    serviceArea = PreferenceUtils.getString(Preferences.citizenService);
    // serviceArea = (sharedPreferences.getString('ServiceselectionType'));
    PreferenceUtils.setString(Preferences.subgroupId, sungroupid);
    print(mainServID + serviceArea);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            CitizenServiceList(sungroupid, mainServID, serviceArea)));
    // });
  }
}
