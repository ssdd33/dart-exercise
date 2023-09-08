/*
-tree
--root : node
--sortedData
--insert

-node
--data
--left
--right
--insert
*/
class Node {
  final String data;
  Node? left;
  Node? right;
  Node(this.data);

  void insert(String value) {
    int nodeData = int.parse(data);
    int newData = int.parse(value);

    Node newNode = Node(value);

    if (newData <= nodeData) {
      print('$value left');
      if (left == null) {
        left = newNode;
      } else {
        left!.insert(value);
      }
    } else {
      print('$value right');
      if (right == null) {
        right = newNode;
      } else {
        right!.insert(value);
      }
    }
  }

  List<String> sortedData() {
    final result = <String>[];
    if (left != null) {
      result.addAll(left!.sortedData());
    }
    result.add(data);
    if (right != null) {
      result.addAll(right!.sortedData());
    }
    return result;
  }
}

class BinarySearchTree {
  late final Node root;
  List<String> sortedData = [];

  BinarySearchTree(String data) {
    root = Node(data);
    sortedData = [data];
  }

  void insert(String data) {
    root.insert(data);
    sortedData = root.sortedData();
  }
}


// class Node {
//   final String? _data;
//   Node _left = Node(data: null);
//   Node _right = Node(data: null);

//   Node({String? data}) : this._data = data;

//   String? get data => _data;
//   Node get left => _left;
//   Node get right => _right;
//   set left(Node node) => this._left = node;
//   set right(Node node) => this._right = node;
// }

// class BinarySearchTree {
//   final Node rootNode;

//   BinarySearchTree(String rootData) : this.rootNode = Node(data: rootData);

//   Node get root => rootNode;

//   void travelseAndInsert(Node currentNode, String data) {
//     int curData = int.parse(currentNode.data!);
//     int newData = int.parse(data);
//     if (curData < newData) {
//       if (currentNode.right.data != null) {
//         return travelseAndInsert(currentNode.right, data);
//       } else {
//         currentNode.right = Node(data: data);
//       }
//     } else {
//       if (currentNode.left.data != null) {
//         return travelseAndInsert(currentNode.left, data);
//       } else if (curData > newData) {
//         currentNode.left = Node(data: data);
//       }
//     }
//     return;
//   }

//   void insert(String data) {
//     travelseAndInsert(rootNode, data);
//   }

//   List<String> travelseAndSort(Node node) {
//     final list = <String>[];
//     if (node.left.data != null) {
//       list.addAll(travelseAndSort(node.left));
//     } else {
//       list.add(node.data!);
//       if (node.right.data != null) {
//         list.addAll(travelseAndSort(node.right));
//       }
//     }
//     return list;
//   }

//   List<String> sortedData() {
//     return travelseAndSort(rootNode);
//   }
// }
