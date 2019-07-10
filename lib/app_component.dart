import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/hero.dart';
import 'src/mock_heroes.dart';
import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    coreDirectives,
    formDirectives
    ],
    providers: [ClassProvider(HeroService)],
)
class AppComponent implements OnInit{
  final HeroService _heroService;
  AppComponent(this._heroService);
  final title = 'Tour of Heros';
  List<Hero> heroes;
  Hero selected;

Future<void> _getHeroes() async {
  heroes = await _heroService.getAll();
}
  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selected = hero;
}
