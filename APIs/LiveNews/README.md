# Live News

The full set of available real-time news articles can be accessed using a simple API request to the mediastack API's news endpoint. Below you will find an example API request as well as a series of optional parameters you can use to filter your news results.

> **Delayed news on Free Plan:** Please note that account subscribed to the Free Plan will receive live news only with a 30-minute delay. To lift this limitation and get news in real-time, please sign up or upgrade to the Standard Plan or higher.

### Example API Request:

```bash
http://api.mediastack.com/v1/news
    ? access_key = 8d9c896b91e96e81417344411fecc928
    & keywords = tennis
    & countries = us, gb, de
```
