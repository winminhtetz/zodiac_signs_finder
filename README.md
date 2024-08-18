# **Find My Zodiac Signs**

Base URL

```
https://zodiac-signs-finder-8801.globeapp.dev/
```

Firstly, find the city where you born

```
[GET]:base_url/find_city?city=yangon
```

And then find your zodiac sings: 

```
[POST]:base_url/get_my_zodiac

request: {
    "name": "",
    "sex": 1,
    "d1month": 9,
    "d1day": 1,
    "d1year": 2003,
    "d1hour": 2,
    "d1min": 20,
    "cityList": "Yangon,0,95,16.83,96.00"
}
```