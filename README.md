# toast-api
A RESTful api for getting random Georgian traditional toast.

##### Start dev server:
```sh
$ GOOGLE_APPLICATION_CREDENTIALS=<path to credentials file> coffee index.coffee
```

##### Accepted api calls:
```sh
GET /api/toast/random # Returns random toast
GET /api/toast/en/random # Returns google translated toast
```

##### Response format:
```sh
{
    "language": "<language of the toast>",
    "toast": "<toast text>",
}
```