# Authenticate your Flutter application using Asgardeoo

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
