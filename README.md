# toast-api
A RESTful api using Node.js server written in CoffeeScript and using Express.js for getting random Georgian traditional toast.
Google Translate API is used to translate the toasts into English.

##### Start dev server:
```sh
$ GOOGLE_APPLICATION_CREDENTIALS=<path to credentials file> coffee index.coffee
```

##### Accepted api calls:
```sh
GET /api/toast/ka/random        # Returns random toast as json
GET /api/toast/ka/random/text   # Returns random toast as plain text
GET /api/toast/en/random        # Returns google translated toast as json
GET /api/toast/en/random/text   # Returns google translated toast as plain text
```

##### Response format (JSON):
```sh
{
    "language": "<language of the toast>",
    "toast": "<toast text>",
}
```