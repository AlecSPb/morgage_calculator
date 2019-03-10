import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class PhotoMapPage extends StatefulWidget {
  static final String route = "photo_map_page";

  @override
  State<StatefulWidget> createState() => _PhotoMapPage();
}

class _PhotoMapPage extends State<PhotoMapPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    var appBar = AppBar(
      title: Text("карта"),
      elevation: 0.0,
      backgroundColor: Colors.grey.withOpacity(0.5),
    );
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            PhotoMap(),

            ///список ТВС точек со встроенной картой
           /* ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return _MapTile(index);
              },
            ),*/
            //PhotoMap(),
            Container(
              child: appBar,
              height: appBar.preferredSize.height + mediaQuery.padding.top,
            ),
          ],
        ));
  }
}

class PhotoMap extends StatefulWidget {
  final double _kBottomViewExpandFactor = 0.5;
  final _defaultCenter = LatLng(55.751244, 37.618423);
  final double _defaultZoom = 5;
  final String _urlTemplate =
      "http://osm.ptmobile.ru/geoserver/gwc/service/tms/1.0.0/osm:osm@EPSG:900913@png/{z}/{x}/{y}.png";

  @override
  _PhotoMapState createState() => _PhotoMapState();
}

class _PhotoMapState extends State<PhotoMap> {
  MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options:
          MapOptions(center: widget._defaultCenter, zoom: widget._defaultZoom),
      layers: [TileLayerOptions(tms: true, urlTemplate: widget._urlTemplate)],
    );
  }
}

class _MapTile extends StatelessWidget {
  int _id;
  MapController _mapController = MapController();

  _MapTile(
    this._id, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(width: 56, height: 56,child: PhotoMap(),),
      title: Text("$_id"),
      isThreeLine: true,
      subtitle: Text("fdfdfdfdfdf"),
    );
  }
}
