import 'package:ntv_mock/model/news_category.dart';

class News {
  String _tid;
  String _name;
  List<Items> _items;

  News({String tid, String name, List<Items> items}) {
    this._tid = tid;
    this._name = name;
    this._items = items;
  }

  String get tid => _tid;
  set tid(String tid) => _tid = tid;
  String get name => _name;
  set name(String name) => _name = name;
  List<Items> get items => _items;
  set items(List<Items> items) => _items = items;

  News.fromJson(Map<String, dynamic> json) {
    _tid = json['tid'];
    _name = json['name'];
    if (json['items'] != null) {
      _items = new List<Items>();
      json['items'].forEach((v) {
        _items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tid'] = this._tid;
    data['name'] = this._name;
    if (this._items != null) {
      data['items'] = this._items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String _nid;
  String _title;
  String _url;
  String _created;
  String _updated;
  List<Author> _author;
  String _body;
  UrlCategory _urlCategory;
  List<NewsCategory> _newsCategory;
  FeaturedImage _featuredImage;
  String _hideFeaturedImageInDetails;

  Items(
      {String nid,
        String title,
        String url,
        String created,
        String updated,
        List<Author> author,
        String body,
        UrlCategory urlCategory,
        List<NewsCategory> newsCategory,
        FeaturedImage featuredImage,
        String hideFeaturedImageInDetails}) {
    this._nid = nid;
    this._title = title;
    this._url = url;
    this._created = created;
    this._updated = updated;
    this._author = author;
    this._body = body;
    this._urlCategory = urlCategory;
    this._newsCategory = newsCategory;
    this._featuredImage = featuredImage;
    this._hideFeaturedImageInDetails = hideFeaturedImageInDetails;
  }

  String get nid => _nid;
  set nid(String nid) => _nid = nid;
  String get title => _title;
  set title(String title) => _title = title;
  String get url => _url;
  set url(String url) => _url = url;
  String get created => _created;
  set created(String created) => _created = created;
  String get updated => _updated;
  set updated(String updated) => _updated = updated;
  List<Author> get author => _author;
  set author(List<Author> author) => _author = author;
  String get body => _body;
  set body(String body) => _body = body;
  UrlCategory get urlCategory => _urlCategory;
  set urlCategory(UrlCategory urlCategory) => _urlCategory = urlCategory;
  List<NewsCategory> get newsCategory => _newsCategory;
  set newsCategory(List<NewsCategory> newsCategory) =>
      _newsCategory = newsCategory;
  FeaturedImage get featuredImage => _featuredImage;
  set featuredImage(FeaturedImage featuredImage) =>
      _featuredImage = featuredImage;
  String get hideFeaturedImageInDetails => _hideFeaturedImageInDetails;
  set hideFeaturedImageInDetails(String hideFeaturedImageInDetails) =>
      _hideFeaturedImageInDetails = hideFeaturedImageInDetails;

  Items.fromJson(Map<String, dynamic> json) {
    _nid = json['nid'];
    _title = json['title'];
    _url = json['url'];
    _created = json['created'];
    _updated = json['updated'];
    if (json['author'] != null) {
      _author = new List<Author>();
      json['author'].forEach((v) {
        _author.add(new Author.fromJson(v));
      });
    }
    _body = json['body'];
    _urlCategory = json['url_category'] != null
        ? new UrlCategory.fromJson(json['url_category'])
        : null;
    if (json['news_category'] != null) {
      _newsCategory = new List<NewsCategory>();
      json['news_category'].forEach((v) {
        _newsCategory.add(new NewsCategory.fromJson(v));
      });
    }
    _featuredImage = json['featured_image'] != null
        ? new FeaturedImage.fromJson(json['featured_image'])
        : null;
    _hideFeaturedImageInDetails = json['hide_featured_image_in_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nid'] = this._nid;
    data['title'] = this._title;
    data['url'] = this._url;
    data['created'] = this._created;
    data['updated'] = this._updated;
    if (this._author != null) {
      data['author'] = this._author.map((v) => v.toJson()).toList();
    }
    data['body'] = this._body;
    if (this._urlCategory != null) {
      data['url_category'] = this._urlCategory.toJson();
    }
    if (this._newsCategory != null) {
      data['news_category'] =
          this._newsCategory.map((v) => v.toJson()).toList();
    }
    if (this._featuredImage != null) {
      data['featured_image'] = this._featuredImage.toJson();
    }
    data['hide_featured_image_in_details'] = this._hideFeaturedImageInDetails;
    return data;
  }
}

class Author {
  String _nid;
  String _name;

  Author({String nid, String name}) {
    this._nid = nid;
    this._name = name;
  }

  String get nid => _nid;
  set nid(String nid) => _nid = nid;
  String get name => _name;
  set name(String name) => _name = name;

  Author.fromJson(Map<String, dynamic> json) {
    _nid = json['nid'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nid'] = this._nid;
    data['name'] = this._name;
    return data;
  }
}

class UrlCategory {
  String _tid;
  String _name;

  UrlCategory({String tid, String name}) {
    this._tid = tid;
    this._name = name;
  }

  String get tid => _tid;
  set tid(String tid) => _tid = tid;
  String get name => _name;
  set name(String name) => _name = name;

  UrlCategory.fromJson(Map<String, dynamic> json) {
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

class FeaturedImage {
  String _image;
  String _caption;

  FeaturedImage({String image, String caption}) {
    this._image = image;
    this._caption = caption;
  }

  String get image => _image;
  set image(String image) => _image = image;
  String get caption => _caption;
  set caption(String caption) => _caption = caption;

  FeaturedImage.fromJson(Map<String, dynamic> json) {
    _image = json['image'];
    _caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this._image;
    data['caption'] = this._caption;
    return data;
  }
}
