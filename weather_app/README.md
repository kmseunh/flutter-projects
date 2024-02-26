# flutter-weather-app

## 💬 설명

이 App은 사용자가 지정한 도시의 현재 날씨 정보를 제공합니다. 사용자는 앱을 실행하고 기본적으로 설정된 도시의 현재 날씨를 확인할 수 있습니다.

&nbsp;

## 🖥️ 화면 구성

| 초기화면 |
|:----:|
| ![image](https://github.com/kmseunh/flutter-projects/assets/105186724/467919e5-b56a-48f6-9321-1fa5a86332a5) |

&nbsp;

## 🛠️ 기능 설명

- 기본적으로 설정된 도시의 현재 날씨 정보를 표시합니다. 이 정보에는 온도, 날씨 상태, 습도, 풍속 및 기압이 포함됩니다.
- 다음 몇 시간 동안의 시간당 예보를 표시합니다. 각 예보에는 시간, 온도 및 날씨 상태를 표시합니다.
- 사용자는 화면을 새로 고침하여 최신 날씨 정보를 가져올 수 있습니다.

&nbsp;

## </> 주요 코드

```dart
Future<Map<String, dynamic>> getCurrentWeather() async {
  try {
    String cityName = 'London'; // 기본적으로 London 날씨를 가져옴
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
      ),
    );

    final data = jsonDecode(res.body);

    if (data['cod'] != '200') {
      throw 'An unexpected error occurred';
    }

    return data;
  } catch (e) {
    throw e.toString();
  }
}
```

&nbsp;

## 📃 Reference

⛅️ [OpenWeather API](https://openweathermap.org)
