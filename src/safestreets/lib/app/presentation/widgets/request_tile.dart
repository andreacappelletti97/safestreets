import 'package:flutter/material.dart';
import 'package:safestreets/app/data/models/request.dart';

class RequestTile extends StatelessWidget {
  final Request request;

  const RequestTile({
    Key key,
    @required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(request.imageUrl),
      title: Text(
        '${request.licensePlate}',
      ),
      subtitle: Text(
        'lat: ${request.latitude}, long: ${request.longitude}',
      ),
      trailing: CircleAvatar(
        child: _mapTypeToIcon(),
      ),
    );
  }

  Icon _mapTypeToIcon() {
    switch (request.violationType) {
      case 'generic':
        return Icon(Icons.error);
      case 'parking':
        return Icon(Icons.local_parking);
      case 'noAuth':
        return Icon(Icons.phonelink_lock);
      case 'noPay':
        return Icon(Icons.money_off);
      default:
        return Icon(Icons.error);
    }
  }
}
