class NewsCategory {
  String _tid;
  String _name;
  List<Children> _children;

  NewsCategory({String tid, String name, List<Children> children}) {
    this._tid = tid;
    this._name = name;
    this._children = children;
  }

  String get tid => _tid;
  set tid(String tid) => _tid = tid;
  String get name => _name;
  set name(String name) => _name = name;
  List<Children> get children => _children;
  set children(List<Children> children) => _children = children;

  NewsCategory.fromJson(Map<String, dynamic> json) {
    _tid = json['tid'];
    _name = json['name'];
    if (json['children'] != null) {
      _children = new List<Children>();
      json['children'].forEach((v) {
        _children.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tid'] = this._tid;
    data['name'] = this._name;
    if (this._children != null) {
      data['children'] = this._children.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  String _tid;
  String _name;

  Children({String tid, String name}) {
    this._tid = tid;
    this._name = name;
  }

  String get tid => _tid;
  set tid(String tid) => _tid = tid;
  String get name => _name;
  set name(String name) => _name = name;

  Children.fromJson(Map<String, dynamic> json) {
    _tid = json['tid'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tid'] = this._tid;
    data['name'] = this._name;
    return data;
  }
}


