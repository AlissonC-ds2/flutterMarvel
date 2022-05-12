class AutoGenerate {
  AutoGenerate({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.data,
    required this.etag,
  });
  late final String code;
  late final String status;
  late final String copyright;
  late final String attributionText;
  late final String attributionHTML;
  late final Data data;
  late final String etag;
  
  AutoGenerate.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    data = Data.fromJson(json['data']);
    etag = json['etag'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['copyright'] = copyright;
    _data['attributionText'] = attributionText;
    _data['attributionHTML'] = attributionHTML;
    _data['data'] = data.toJson();
    _data['etag'] = etag;
    return _data;
  }
}

class Data {
  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });
  late final String offset;
  late final String limit;
  late final String total;
  late final String count;
  late final List<Results> results;
  
  Data.fromJson(Map<String, dynamic> json){
    offset = json['data']['offset'].toString();
    limit = json['data']['limit'].toString();
    total = json['data']['total'].toString();
    count = json['data']['count'].toString();
    results = List.from(json['data']['results']).map((e)=>Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['offset'] = offset;
    _data['limit'] = limit;
    _data['total'] = total;
    _data['count'] = count;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String modified;
  late final String resourceURI;
  late final List<Urls> urls;
  late final Thumbnail thumbnail;
  late final Comics comics;
  late final Stories stories;
  late final Events events;
  late final Series series;
  
  Results.fromJson(Map<String, dynamic> json){
    id = json['id'].toString();
    name = json['name'].toString();
    description = json['description'].toString();
    modified = json['modified'].toString();
    resourceURI = json['resourceURI'].toString();
    // urls = List.from(json['urls']).map((e)=>Urls.fromJson(e)).toList();
    thumbnail = Thumbnail.fromJson(json['thumbnail']);
    // comics = Comics.fromJson(json['comics']);
    // stories = Stories.fromJson(json['stories']);
    // events = Events.fromJson(json['events']);
    // series = Series.fromJson(json['series']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['modified'] = modified;
    _data['resourceURI'] = resourceURI;
    _data['urls'] = urls.map((e)=>e.toJson()).toList();
    _data['thumbnail'] = thumbnail.toJson();
    _data['comics'] = comics.toJson();
    _data['stories'] = stories.toJson();
    _data['events'] = events.toJson();
    _data['series'] = series.toJson();
    return _data;
  }
}

class Urls {
  Urls({
    required this.type,
    required this.url,
  });
  late final String type;
  late final String url;
  
  Urls.fromJson(Map<String, dynamic> json){
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['url'] = url;
    return _data;
  }
}

class Thumbnail {
  Thumbnail({
    required this.path,
    required this.extension,
  });
  late final String path;
  late final String extension;
  
  Thumbnail.fromJson(Map<String, dynamic> json){
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['path'] = path;
    _data['extension'] = extension;
    return _data;
  }
}

class Comics {
  Comics({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
  late final String available;
  late final String returned;
  late final String collectionURI;
  late final List<Items> items;
  
  Comics.fromJson(Map<String, dynamic> json){
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['returned'] = returned;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Items {
  Items({
    required this.resourceURI,
    required this.name,
  });
  late final String resourceURI;
  late final String name;
  
  Items.fromJson(Map<String, dynamic> json){
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['resourceURI'] = resourceURI;
    _data['name'] = name;
    return _data;
  }
}

class Stories {
  Stories({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
  late final String available;
  late final String returned;
  late final String collectionURI;
  late final List<Items> items;
  
  Stories.fromJson(Map<String, dynamic> json){
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['returned'] = returned;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Events {
  Events({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
  late final String available;
  late final String returned;
  late final String collectionURI;
  late final List<Items> items;
  
  Events.fromJson(Map<String, dynamic> json){
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['returned'] = returned;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Series {
  Series({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
  late final String available;
  late final String returned;
  late final String collectionURI;
  late final List<Items> items;
  
  Series.fromJson(Map<String, dynamic> json){
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['returned'] = returned;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}