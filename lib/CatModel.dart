class CatModel{

  final String id;
  final String name;
  final String temperament;
  final String life_span;
  final String alt_names;
  final String wikipedia_url;
  final String origin;
  final String weight_imperial;
  final String reference_image_id;


  CatModel(
      {required this.id, required  this.name, required this.temperament,required  this.life_span, required this.alt_names,required this.wikipedia_url, required this.origin, required this.weight_imperial, required this.reference_image_id
      });

  factory CatModel.fromJson(Map<dynamic, dynamic> parsedjson) {
    return CatModel(
      id: parsedjson['id']?? '0',
      name: parsedjson['name']?? '0',
      temperament: parsedjson['temperament']?? '0',
      life_span: parsedjson['life_span']?? '0',
      alt_names: parsedjson['alt_names']?? '0',
      origin: parsedjson['origin']?? '0',
      weight_imperial: parsedjson['weight_imperial']?? '0',
      wikipedia_url: parsedjson['wikipedia_url']?? '0',
      reference_image_id: parsedjson['reference_image_id']?? '0',



    );
  }
}
