import 'package:ada_lovelace/data/network/dto/task_dto.dart';
import 'package:ada_lovelace/data/network/dto/tasks_list_dto.dart';
import 'package:ada_lovelace/domain/models/task_response.dart';
import 'package:ada_lovelace/domain/models/tasks_list.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tasks_api.g.dart';

@RestApi()
abstract class TasksApi {
  factory TasksApi(Dio dio, {String? baseUrl}) = _TasksApi;

  @GET('/list')
  Future<TasksList> getList();

  @PATCH('/list')
  Future<TasksList> patchList(@Body() final TasksListDto dto);

  @GET('/list/{id}')
  Future<TaskResponse> getTaskById(@Path('id') final String id);

  @POST('/list')
  Future<TasksList> postTask(@Body() final TaskDto dto);

  @PUT('/list/{id}')
  Future<TaskResponse> updateTask(
    @Path('id') final String id,
    @Body() final TaskDto dto,
  );

  @DELETE('/list/{id}')
  Future<TaskResponse> deleteTask(@Path('id') final String id);
}
