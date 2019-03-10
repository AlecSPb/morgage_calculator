import 'package:road_keeper_mobile/data/repositories/auth_repository.dart';
import 'package:road_keeper_mobile/data/shared_pref_repository.dart';
import 'package:road_keeper_mobile/data/web_client.dart';
import 'package:test_api/test_api.dart';

void main() {


  test("graphQLclientTest",()async{
    var sharedPrefRepo = MockSharedPrefRepository("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNTUxMzU4ODc0fQ.hSXa_nkVZhzWvteED59wwVC0dvMcMAVpSS-e2VgNHCE");
    var authRepository = AuthRepository();
    var client = WebClient(sharedPrefRepo, authRepository);
    var query = """
    {
      me {
        id
        username
        first_name
        last_name
      }
    }
    """;

    var connectionQuery = """
       {
        all_photofixation_contours(
          sort:[id_desc]
        ){
          pageInfo{
            hasPreviousPage
            hasNextPage
            startCursor
            endCursor
          }
          edges{
            cursor
            node{
              id
              user_creator_id
              
            }
          }
        }
       }
    """;

    var createUserMutation = """
      mutation(
        \$username: String!
        \$firstName: String!
        \$lastName: String!
        \$password: String!
      ) {
        create_user(
          username: \$username
          first_name: \$firstName
          last_name: \$lastName
          password: \$password
        ) {
          affected {
            username
            first_name
            last_name
          }
        }
    } 
    """;

    var deleteUser = """
      mutation(\$id: ID!){
      delete_user(
        id: \$id
      ){
        affected{
          id
        }
       } 
    }
    """;
    var result = await client.query(deleteUser, {
      "id":"VXNlck5vZGU6MjM=",
    });
   // var result = await authRepository.obtainToken("admin", "1234qwer");
    print(result.data);
  });
}
