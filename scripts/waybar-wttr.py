#!/usr/bin/env python

import json
import requests

WEATHER_CODES = {
    '113': '☀️',
    '116': '⛅',
    '119': '☁️',
    '122': '☁️',
    '143': '☁️',
    '176': '🌧️',
    '179': '🌧️',
    '182': '🌧️',
    '185': '🌧️',
    '200': '⛈️',
    '227': '🌨️',
    '230': '🌨️',
    '248': '☁️',
    '260': '☁️',
    '263': '🌧️',
    '266': '🌧️',
    '281': '🌧️',
    '284': '🌧️',
    '293': '🌧️',
    '296': '🌧️',
    '299': '🌧️',
    '302': '🌧️',
    '305': '🌧️',
    '308': '🌧️',
    '311': '🌧️',
    '314': '🌧️',
    '317': '🌧️',
    '320': '🌨️',
    '323': '🌨️',
    '326': '🌨️',
    '329': '❄️',
    '332': '❄️',
    '335': '❄️',
    '338': '❄️',
    '350': '🌧️',
    '353': '🌧️',
    '356': '🌧️',
    '359': '🌧️',
    '362': '🌧️',
    '365': '🌧️',
    '368': '🌧️',
    '371': '❄️',
    '374': '🌨️',
    '377': '🌨️',
    '386': '🌨️',
    '389': '🌨️',
    '392': '🌧️',
    '395': '❄️'
}

try:
    weather = requests.get("https://wttr.in/tomsk?format=j1", timeout=5).json()
    temp_int = int(weather['current_condition'][0]['FeelsLikeC'])
    extra_char = '+' if 0 < temp_int < 10 else ''
    icon = WEATHER_CODES.get(weather['current_condition'][0]['weatherCode'], '')

    data = {
        'text': f' {icon} {extra_char}{temp_int}°'
    }
    print(json.dumps(data))

except (requests.exceptions.RequestException, ValueError, KeyError) as e:
    print(json.dumps({'text': 'Error'}))