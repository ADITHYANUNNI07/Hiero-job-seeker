import 'package:flutter/material.dart';
import 'package:hiero_job_seeker/application/model/state_model.dart';
import 'package:hiero_job_seeker/domain/repositories/post/post_repo.dart';

class PostProvider with ChangeNotifier {
  final PostRepository postRepository;

  PostProvider(this.postRepository);

  var _state = const StateModel.initial();
  StateModel get state => _state;
  Future<void> getAllJob(String accessToken) async {
    _setState(const StateModel.loading());
    try {
      final result = await postRepository.getAllJob(accessToken);
      if (result is String) {
        _setState(StateModel.error(result));
      } else {
        _setState(StateModel.loggedIn(result));
      }
    } catch (e) {
      _setState(StateModel.error(e.toString()));
    }
  }

  void _setState(StateModel state) {
    _state = state;
    notifyListeners();
  }
}
