### HTTP GET Request Parameters:

- `access_key` - Use this parameter to specify your unique API access key

- `sources` - Use this parameter to include or exclude one or multiple comma-separated news sources. Example: To include CNN, but exclude BBC: `&sources=cnn,-bbc`

- `categories` - Use this parameter to include or exclude one or multiple comma-separated news categories. Example: To include business, but exclude sports: `&sources=business,-sports`.

  - `general` - Uncategorized News

  - `business` - Business News

  - `entertainment` - Entertainment News

  - `health` - Health News

  - `science` - Science News

  - `sports` - Sports News

  - `technology` - Technology News

- `countries` - Use this parameter to include or exclude one or multiple comma-separated countries. Example: To include Australia, but exclude the US: `&sources=au,-us`.

  - [See all supported countries](https://mediastack.com/sources)

- `languages` - Use this parameter to include or exclude one or multiple comma-separated languages. Example: To include English, but exclude German: `&sources=en,-de`.

  - `ar` - Arabic
  - `de` - German
  - `en` - English
  - `es` - Spanish
  - `fr` - French
  - `he` - Hebrew
  - `it` - Italian
  - `nl` - Dutch
  - `no` - Norwegian
  - `pt` - Portuguese
  - `ru` - Russian
  - `se` - Swedish
  - `zh` - Chinese

- `keywords` - Use this parameter to seach for sentences, you can also exclude words that you do not want to appear in your search results. Example: To search for "New movies 2021" but exclude "Matrix": `&sources=new movies 2021 -matrix`

- `date` - Use this parameter to specify a date or date range. Example: `&date=2020-01-01` for news on Jan 1st and `&date=2020-12-24,2020-12-31` for news between Dec 24th and 31st.

- `sort` - Use this parameter to specify a sorting order. Available values: `published_desc` (default), `published_asc`, `popularity`

- `limit` - Use this parameter to specify a pagination limit (number of results per page) for your API request. Default limit value is `25`, maximum allowed limit value is `100`.

- `offset` - Use this parameter to specify a pagination offset value for your API request. Example: An offset value of `100` combined with a limit value of 10 would show results 100-110. Default value is `0`, starting with the first available result.

### Example API Response:

```json
{
    "pagination": {
        "limit": 100,
        "offset": 0,
        "count": 100,
        "total": 293
    },
    "data": [
        {
            "author": "TMZ Staff",
            "title": "Rafael Nadal Pulls Out Of U.S. Open Over COVID-19 Concerns",
            "description": "Rafael Nadal is officially OUT of the U.S. Open ... the tennis legend said Tuesday it's just too damn unsafe for him to travel to America during the COVID-19 pandemic. \"The situation is very complicated worldwide,\" Nadal wrote in a statement. \"The…",
            "url": "https://www.tmz.com/2020/08/04/rafael-nadal-us-open-tennis-covid-19-concerns/",
            "source": "TMZ.com",
            "image": "https://imagez.tmz.com/image/fa/4by3/2020/08/04/fad55ee236fc4033ba324e941bb8c8b7_md.jpg",
            "category": "general",
            "language": "en",
            "country": "us",
            "published_at": "2020-08-05T05:47:24+00:00"
        },
        [...]
    ]
}
```
