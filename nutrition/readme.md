# Nutrition Api

# Prerequisites
In order to run you need to install dotnet. I got it from the Visual Studio
Community (not to be confused with vscode!). There's probably way to get it
that doesn't involve installing GB worth of IDE, but I'm not sure what that
is. If you figure out a way that works, put it in here!

# Running
Once you have dotnet, cd into the `nutrition` folder and run
```
dotnet run --project api
```
It might take a hot minute the first time you run it because it needs to
construct the database from the raw data. You'll know it's up once you
get something that looks like this:
```
$ dotnet run --project api
Building...
info: Microsoft.Hosting.Lifetime[14]
      Now listening on: http://localhost:5289
info: Microsoft.Hosting.Lifetime[0]
      Application started. Press Ctrl+C to shut down.
info: Microsoft.Hosting.Lifetime[0]
      Hosting environment: Development
info: Microsoft.Hosting.Lifetime[0]
      Content root path: C:\Users\aacoo\source\repos\nutrition\api
```

At this point you can check to make sure it's working with something like
postman or curl, or even your browser should wrok. Using whichever tool you
prefer, test this URL: `127.0.0.1:<port>/food/503353`. You should receive this
json object:
```
{
    "id": 503353,
    "description": "Babyfood, cereal, soya, with fruit, dry",
    "kCal": 364
}
```
If that happened, you're good!

# Usage
The fastest way to figure out this API is probably just to open 
`http://127.0.0.1:<port>/swagger` in your browser while the server is running.
It should open a page that'll let you try out the endpoints and describe the
data schemas and etc. But if you prefer reading, read on.

The API has two endpoints. The first is `GET /Food/{id}`, and the second is
`GET /Food/search`. Additionally there's a single data schema: `Food`.

## `GET /Food/{id}`
Return the food item with an `id` matching `{id}`.

### Example
Uri:
```
/food/503353
```
Result:
```
{
    "id": 503353,
    "description": "Babyfood, cereal, soya, with fruit, dry",
    "kCal": 364
}
```

## `GET /Food/search`
Return an array of objects whose descriptions contain the query string.
### Parameters
`q`: The substring to search for in food descriptions
### Example
Uri:
```
/food/search?q=soya
```
Result:
```
[
    {
        "id": 503353,
        "description": "Babyfood, cereal, soya, with fruit, dry",
        "kCal": 364
    },
    {
        "id": 503354,
        "description": "Babyfood, cereal, soya, with fruit, prepared with formula or breast milk",
        "kCal": 139
    }
]
```

## Food
### Attributes:
- id
    - type: integer
    - description: a unique identifer for this food item.
- description
    - type: string
    - description: a text description of the food written in English.
- kCal
    - type: integer
    - description: the amount of kilocalories (which apparently just means
    calories? They're used interchangeably? That's kind of wacky) contained
    in 100g of this food item. It is possible to provide more user friendly
    info than "100g", but it'll take more time. Let me know if this is a big
    priority and we'll get right on it.
### Example Json
```
{
    "id": 503353,
    "description": "Babyfood, cereal, soya, with fruit, dry",
    "kCal": 364
},
```
