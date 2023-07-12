
import 'package:hive/hive.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 00)
class Pokemon {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? imageurl;
  @HiveField(3)
  String? xdescription;
  @HiveField(4)
  String? ydescription;
  @HiveField(5)
  String? height;
  @HiveField(6)
  String? category;
  @HiveField(7)
  String? weight;
  @HiveField(8)
  List? typeofpokemon;
  @HiveField(9)
  String? weaknesses;
  @HiveField(10)
  String? evolutions;
  @HiveField(11)
  String? abilities;
  @HiveField(12)
  int? hp;
  @HiveField(13)
  int? attack;
  @HiveField(14)
  int? defense;
  @HiveField(15)
  int? special_attack;
  @HiveField(16)
  int? special_defense;
  @HiveField(17)
  int? speed;
  @HiveField(18)
  int? total;
  @HiveField(19)
  String? male_percentage;
  @HiveField(20)
  String? female_percentage;
  @HiveField(21)
  int? genderless;
  @HiveField(22)
  String? cycles;
  @HiveField(23)
  String? egg_groups;
  @HiveField(24)
  String? evolvedfrom;
  @HiveField(25)
  String? reason;
  @HiveField(26)
  String? base_exp;

  Pokemon({
    this.name,
    this.id,
    this.imageurl,
    this.xdescription,
    this.ydescription,
    this.height,
    this.category,
    this.weight,
    this.typeofpokemon,
    this.weaknesses,
    this.evolutions,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.special_attack,
    this.special_defense,
    this.speed,
    this.total,
    this.male_percentage,
    this.female_percentage,
    this.genderless,
    this.cycles,
    this.egg_groups,
    this.evolvedfrom,
    this.reason,
    this.base_exp,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    imageurl = json['imageurl'];
    xdescription = json['xdescription'];
    ydescription = json['ydescription'];
    height = json['height'];
    category = json['category'];
    weight = json['weight'];
    typeofpokemon = json['typeofpokemon'];
    weaknesses = json['weaknesses'].toString();
    evolutions = json['evolutions'].toString();
    abilities = json['abilities'].toString();
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    special_attack = json['special_attack'];
    special_defense = json['special_defense'];
    speed = json['speed'];
    total = json['total'];
    male_percentage = json['male_percentage'];
    female_percentage = json['female_percentage'];
    genderless = json['genderless'];
    cycles = json['cycles'];
    egg_groups = json['egg_groups'];
    evolvedfrom = json['evolvedfrom'];
    reason = json['reason'];
    base_exp = json['base_exp'];
  }
}
