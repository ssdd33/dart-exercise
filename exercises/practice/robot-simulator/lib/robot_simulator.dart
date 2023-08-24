import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';

class Robot {
  Position position;
  Orientation orientation;
  Robot(
    this.position,
    this.orientation,
  );

  void move(String directs) {
/*
linkedList direction [E,S,W,N]
turn Left ->  idxOf currentDirection -1
turn right - >                       +1

advance rule
E: x++
S: y--
W: x--
N: y++
*/

    for (String direct in directs.split('')) {
      switch (direct) {
        case 'A':
          {
            _advance();
          }
          break;
        default:
          {
            _turn(direct);
          }
          break;
      }
    }
  }

  void _advance() {
    switch (orientation) {
      case Orientation.north:
        {
          position = Position(position.x, position.y + 1);
        }
        break;
      case Orientation.east:
        {
          position = Position(position.x + 1, position.y);
        }
        break;
      case Orientation.south:
        {
          position = Position(position.x, position.y - 1);
        }
        break;
      case Orientation.west:
        {
          position = Position(position.x - 1, position.y);
        }
        break;
    }
  }

  void _turn(String side) {
    print(side);
    final orientations = Orientation.values.toList();
    int index = orientations.indexOf(orientation);
    print(index);

    switch (side) {
      case 'L':
        {
          orientation = _linkedListOfOrientation(index - 1);
        }
        break;
      case 'R':
        {
          print(orientation);
          orientation = _linkedListOfOrientation(index + 1);
          print(orientation);
        }
        break;
    }
  }

  Orientation _linkedListOfOrientation(int index) {
    final orientations = Orientation.values.toList();

    while (index > 3 || index < 0) {
      if (index > 3) {
        index -= 4;
      } else if (index < 0) {
        index += 4;
      }
    }

    return orientations[index];
  }
}
