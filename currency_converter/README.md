# flutter-image-slider

## 💬 설명

이 App은 사용자가 미국 달러(`USD`)를 인도 루피(`INR`)로 변환하는 데 도움을 주는 간단한 모바일 애플리케이션입니다.

&nbsp;

## 🖥️ 화면 구성

| 초기화면 | 실행화면 |
|:----:|:----:|
| ![image](https://github.com/kmseunh/svelte-projects/assets/105186724/9981266a-4e3e-437e-816c-2f0fb1fb8497) | ![image](https://github.com/kmseunh/svelte-projects/assets/105186724/2ce85b3e-f401-4320-b642-22da59cd15b7) |

&nbsp;

## 🛠️ 기능 설명

- 사용자는 미국 달러(`USD`) 금액을 입력할 수 있습니다.
- 앱은 사용자가 입력한 미국 달러(`USD`) 금액을 인도 루피(`INR`)로 변환합니다.
- 변환된 금액은 화면에 실시간으로 표시됩니다.
- 간단한 사용자 인터페이스를 통해 사용자가 쉽게 금액을 입력하고 변환할 수 있습니다.

&nbsp;

## </> 주요 코드

```dart
class CurrencyConverterWidget extends StatefulWidget {
  // 위젯의 상태를 관리합니다.
  @override
  _CurrencyConverterWidgetState createState() => _CurrencyConverterWidgetState();
}

class _CurrencyConverterWidgetState extends State<CurrencyConverterWidget> {
  // 변환된 결과를 저장합니다.
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  // 화폐를 변환하는 함수입니다.
  void convert() {
    result = Converter.convertToINR(double.parse(textEditingController.text));
    setState(() {});
  }

  // 위젯이 dispose 될 때 호출됩니다.
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // 위젯을 빌드합니다.
  @override
  Widget build(BuildContext context) {
    // 위젯의 UI를 구성합니다.
    // ...
  }
}
```
