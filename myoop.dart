abstract class Shape {
  double get area;
}

class Rectangle implements Shape {
  double width;
  double height;
  Rectangle(this.width, this.height);
  @override
  double get area => width * height;
}

class Circle implements Shape {
  double radius;
  Circle(this.radius);
  @override
  double get area => 3.14 * radius * radius;
}

final shapesData = {
  "Rectangle": {"width": 5.0, "height": 10.0},
  "Circle": {"radius": 8.0},
};

void main() {
  List<Shape> shapes = [];

  for (String shapeType in shapesData.keys) {
    final values = shapesData[shapeType];

    if (values != null) {
      if (shapeType == "Rectangle" &&
          values.containsKey("width") &&
          values.containsKey("height")) {
        shapes.add(
            Rectangle(values["width"] as double, values["height"] as double));
      } else if (shapeType == "Circle" && values.containsKey("radius")) {
        shapes.add(Circle(values["radius"] as double));
      } else {
        print("Invalid data format for shape: $shapeType");
      }
    } else {
      print("No data found for shape: $shapeType");
    }
  }

  for (Shape shape in shapes) {
    print("Area: ${shape.area}");
  }
}
