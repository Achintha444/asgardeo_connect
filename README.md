# Authenticate your Flutter application using Asgardeo

This is an sample application that explains how to authenticate your Flutter application using Asgardeo.

## Getting Started

The main details on how to get started to use Asgardeo with Flutter is in the following Medium article.
[link]


### After that
* Go to the `config/config.json` and edit these values according to your configuration
```
{
    "AuthorizationConfig": {
        "BaseOrganizationUrl": <BASE ORGANIZATION URL>,
        "ClientId": <CLIENT ID OF THE APPLICAITON>,
        "Scopes": [
            "openid",
            "email",
            "profile",
            "internal_login"
        ]
    }
}
```

### Main functions

#### Login function
Login function is in `lib/controller/login_controller/login_controller.dart`.
```
  static Future<AuthorizationTokenResponse?> loginAction() async {
    final String clinetId = await AuthorizationConfigUtil.getClientId();
    final List<String> scopes = await AuthorizationConfigUtil.getScopes();
    final String discoveryUrl = await AuthorizationConfigUtil.getDiscoveryUrl();

    try {
      final AuthorizationTokenResponse? result =
          await _flutterAppAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clinetId,
          AuthorizationConfigUtil.getRedirectUrl(),
          discoveryUrl: discoveryUrl,
          scopes: scopes,
        ),
      );

      inspect(result);

      return result;
    } catch (e, s) {
      inspect("login error: $e - stack: $s");
      throw Exception("Failed to login");
    }
  }
```

#### Logout function
Logout function is in `lib/controller/login_controller/login_controller.dart`.
```
  static Future<EndSessionResponse?> logoutAction(
      AuthorizationTokenResponse authorizationTokenResponse) async {
    final String discoveryUrl = await AuthorizationConfigUtil.getDiscoveryUrl();

    try {
      final EndSessionResponse? result = await _flutterAppAuth.endSession(
        EndSessionRequest(
          idTokenHint:
              AuthorizationConfigUtil.getIdToken(authorizationTokenResponse),
          postLogoutRedirectUrl: AuthorizationConfigUtil.getRedirectUrl(),
          discoveryUrl: discoveryUrl,
        ),
      );

      inspect(result);

      return result;
    } catch (e, s) {
      inspect("logout error: $e - stack: $s");
      throw Exception("Failed to logout");
    }
  }
  ```
  
#### Get user details function
Get user details function is in `lib/controller/user_details_controller/user_details_controller.dart`.
```
  static Future<User> getUserDetails(AuthorizationTokenResponse authorizationTokenResponse) async {
    String userinfoUrl = await UserDetailsControllerUtil.getUserIntoUrl();
    String accessToken = AuthorizationConfigUtil.getAccessToken(authorizationTokenResponse);

    final Response response = await Common.getCall(accessToken, userinfoUrl);

    if (response.statusCode == 200) {
      return User.fromJsonString(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }
  ```
