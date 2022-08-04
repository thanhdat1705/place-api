import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_places_api_mobile/shared/models/fields/fields.dart';
// import 'package:project_places_api_mobile/shared/models/fields/field_model.dart';

class ListField extends StatelessWidget {
  final List<Field> fields;

  const ListField({
    Key key,
    @required this.fields,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: fields.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              final Field field = fields[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: _CardField(
                  field: field,
                ),
              );
            }
            final Field field = fields[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: _CardField(
                field: field,
              ),
            );
          },
        ));
  }
}

class _CardField extends StatelessWidget {
  final Field field;

  const _CardField({Key key, this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      child: FlatButton(
        // child: Image.network(this.field.iconUrl),
        child: SvgPicture.network(
          this.field.iconUrl,
          // fit: BoxFit.cover,
          color: Colors.amber,
          width: 50.0,
          height: 50.0,
        ),
        onPressed: () {
          print("click Flied");
        },
      ),
    );
  }
}
