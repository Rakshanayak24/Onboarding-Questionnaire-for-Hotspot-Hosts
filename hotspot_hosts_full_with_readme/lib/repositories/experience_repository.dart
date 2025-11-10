import '../models/experience.dart';
import '../services/api_service.dart';

class ExperienceRepository {
  final ApiService api;
  ExperienceRepository(this.api);

  Future<List<Experience>> getExperiences() => api.fetchExperiences();
}
