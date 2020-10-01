import 'dart:async';
import 'package:flutter/material.dart';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/CitizenService/citizenServiceModel/CitizenserviceModel.dart';
import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
import 'package:navigationdrawer/fragments/CommonService/Loading.dart';
import 'package:navigationdrawer/fragments/smogandpollution/smogandpollutionModel/Smogandpollutionbloc.dart';

class Smollandpollutiondetail extends StatefulWidget {
  final String id;

  const Smollandpollutiondetail(this.id, {Key key}) : super(key: key);
  @override
  _SmollandpollutiondetailState createState() =>
      new _SmollandpollutiondetailState();
}

class _SmollandpollutiondetailState extends State<Smollandpollutiondetail> {
  Future<ApiResponse> list;
  Smogandpollutionbloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = Smogandpollutionbloc(widget.id);
  }

  _apptitle(String id) {
    if (widget.id == '%27SER_UBSAN%27') {
      return AppBar(
        title: Text("SmogandPoll-Rural"),
        elevation: 0.0,
      );
    } else {
      return AppBar(
        title: Text("SmogandPoll-Urban"),
        elevation: 0.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String obj = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: _apptitle(obj),
      body: RefreshIndicator(
          onRefresh: () => _bloc.smogandpollution(widget.id),
          child: StreamBuilder<ApiResponse<CitizenserviceModel>>(
              stream: _bloc.smogPollutionserviceStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case ApiStatus.Loading:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case ApiStatus.Completed:
                      return CitizenserverList(
                          availablelist: snapshot.data.data);
                      break;
                    case ApiStatus.Error:
                      return ErrorMessage(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () => _bloc.smogandpollution(widget.id),
                      );
                      break;
                  }
                }
              })),
    );
  }
}



class CitizenserverList extends StatelessWidget {
  final CitizenserviceModel availablelist;
  const CitizenserverList({Key key, this.availablelist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: availablelist.d.results.length,
        itemBuilder: (context, index) {
          String activityDesc =
              availablelist.d.results[index].subgroupDec;
          print(activityDesc);
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 1.0,
              ),
              child: InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => Citizendetails()));
                  },
                  child: SizedBox(
                    height: 55,
                    child: Container(
                      color: Colors.black45,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          activityDesc.toString(),
                          //  categoryList.categories[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto'),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  )));
        },
        //   itemCount: availablelist.d.results.length,
        // shrinkWrap: true,
        //  physics: ClampingScrollPhysics(),
      ),
    );
  }
}

