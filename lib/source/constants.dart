import 'package:rick_morty/screens/episodes_screen/episode_entity.dart';
import 'package:rick_morty/screens/episodes_screen/season_entity.dart';
import 'package:rick_morty/screens/locations_screen/location_entity.dart';
import 'package:rick_morty/screens/persons_screen/person_entity.dart';
import 'package:rick_morty/screens/setting_screen/profile_entity.dart';
import 'package:rick_morty/source/images.dart';

List<PersonEntity> personList = [
  PersonEntity(
    race: 'Человек',
    image: AppImages.rick,
    name: 'Рик Санчез',
    male: 'Мужской',
    alive: true,
  ),
  PersonEntity(
    race: 'Человек',
    image: AppImages.jivoi,
    name: 'Директор Агенства',
    male: 'Мужской',
    alive: true,
  ),
  PersonEntity(
    race: 'Человек',
    image: AppImages.morty,
    name: 'Морти Смит',
    male: 'Мужской',
    alive: true,
  ),
  PersonEntity(
    race: 'Человек',
    image: AppImages.sammer,
    name: 'Саммер Смит',
    male: 'Женский',
    alive: true,
  ),
  PersonEntity(
    race: 'Человек',
    image: AppImages.albert,
    name: 'Альберт Эйнштейн',
    male: 'Мужской',
    alive: true,
  ),
  PersonEntity(
    race: 'Человек',
    image: AppImages.alan,
    name: 'Алан Райлс',
    male: 'Мужской',
    alive: true,
  ),
  PersonEntity(
    race: 'Человек',
    image: AppImages.alan,
    name: 'Алан Райлс',
    male: 'Мужской',
    alive: true,
  ),
  PersonEntity(
    race: 'Человек',
    image: AppImages.alan,
    name: 'Алан Райлс',
    male: 'Мужской',
    alive: true,
  ),
];
List<LocationEntity> locationList = [
  LocationEntity(
    image: AppImages.earth,
    name: 'Земля C-137',
    type: 'Мир',
    dimension: 'Измерение C-137',
  ),
  LocationEntity(
    image: AppImages.anatomyPark,
    name: 'Анатомический парк',
    type: 'Мир',
    dimension: 'Измерение C-137',
  ),
  LocationEntity(
    image: AppImages.rick,
    name: 'Анатомический парк',
    type: 'Мир',
    dimension: 'Измерение C-137',
  ),
  LocationEntity(
    image: AppImages.logo,
    name: 'Ак',
    type: 'Мир',
    dimension: 'Измерение C-137',
  ),
];
List<EpisodeEntity> episodeList = [
  EpisodeEntity(
    image: AppImages.pilot,
    id: 1,
    name: 'Пилот',
    airDate: '2 декабря 2013 года',
  ),
  EpisodeEntity(
    image: AppImages.dog,
    id: 2,
    name: 'Пес - газонокосильщик',
    airDate: '9 декабря 2013 года',
  ),
  EpisodeEntity(
    image: AppImages.park,
    id: 3,
    name: 'Анатомический парк',
    airDate: '16 декабря 2013 года',
  ),
  EpisodeEntity(
    image: AppImages.naitshiamal,
    id: 4,
    name: 'М. Найт Шьямал-Инопланетяне',
    airDate: '13 января 2014 года',
  ),
  EpisodeEntity(
    image: AppImages.misics,
    id: 5,
    name: 'Мисикс и разрушение',
    airDate: '20 января 2014 года',
  ),
  EpisodeEntity(
    image: AppImages.coctail,
    id: 6,
    name: 'Напиток Рика №9',
    airDate: '20 января 2014 года',
  ),
  EpisodeEntity(
    image: AppImages.gazorpazor,
    id: 7,
    name: 'Воспитание Газорпазора',
    airDate: '20 января 2014 года',
  ),
  EpisodeEntity(
    image: AppImages.gazorpazor,
    id: 7,
    name: 'Воспитание Газорпазора',
    airDate: '20 января 2014 года',
  ),
];
List<SeasonEntity> seasonList = [
  SeasonEntity(
    id: 1,
    episodeList: episodeList,
  ),
  SeasonEntity(
    id: 2,
    episodeList: episodeList,
  ),
  SeasonEntity(
    id: 3,
    episodeList: episodeList,
  ),
  SeasonEntity(
    id: 4,
    episodeList: episodeList,
  ),
];

String about =
    'Зигерионцы помещают Рика и Джери в симуляцию, чтобы узнать рецепт приготовления концентрированной черной материи.';
ProfileEntity profile = ProfileEntity(
  avatar: AppImages.morty,
  login: 'Rick',
  name: 'Oleg Belozerkovsky',
);
String version = 'Rick & Morty V1.0.0';
String theme = 'Темная тема';
String onoff = 'Включена';

enum TextFieldType { fio, login }
enum ScreenType {person, location, episode}
