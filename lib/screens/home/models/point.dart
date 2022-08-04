class Point {
  double latitude;
  double longitude;

  Point(this.latitude, this.longitude);
}

class StreetSegment {
  Point strPoint;
  Point endPoint;
  StreetSegment(this.strPoint, this.endPoint);
}
