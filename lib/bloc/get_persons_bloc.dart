import 'package:flutterblocapp/models/person_response.dart';
import 'package:flutterblocapp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonsListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject = BehaviorSubject();

  getPersons() async {
    PersonResponse persons = await _repository.getPersons();
    _subject.sink.add(persons);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;
}

final personsBloc = PersonsListBloc();
