# News Sources

Using the `sources` endpoint together with a series of search and filter parameters you will be able to search all news sources supported by the mediastack API. The API will return all source metadata available, including the source ID required to define sources when requesting live or historical news.

### Example API Request:

```bash
http://api.mediastack.com/v1/sources
    ? access_key = 8d9c896b91e96e81417344411fecc928
    & search = abc
```

### Available Query Parameters

- **`access_key`**
- **`search`**
- `countries`
- `languages`
- `limit`
- `offset`
