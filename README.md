# Network State Manager

Network State Manager, Flutter uygulamalarında ağ durumlarını ve istisnalarını yönetmek için kullanılan bir pakettir. Bu paket, ağ çağrılarının sonuçlarını `DataState` sınıfı ile sarmalayarak, başarılı ve başarısız durumları kolayca yönetmenizi sağlar.

## Özellikler

- Ağ çağrılarının sonuçlarını `DataState` ile sarmalama
- Detaylı `NetworkExceptions` sınıfı ile hata yönetimi
- Dio kütüphanesi ile uyumlu
- Kolay kullanım için `NetworkStateManager` yardımcı sınıfı

## Kurulum

pubspec.yaml dosyanıza aşağıdaki bağımlılığı ekleyin:

```yaml
dependencies:
  network_state_manager: ^0.0.1
```

## Ardından bağımlılıkları yükleyin:
flutter pub get

## Kullanım

```dart
import 'package:network_state_manager/network_state_manager.dart';
import 'package:dio/dio.dart';

Future<void> fetchData() async {
  final dio = Dio();
  
  final result = await NetworkStateManager.handleNetworkCall(
    call: () => dio.get('https://api.example.com/data'),
  );
  
  result.when(
    success: (data) {
      print('Veri başarıyla alındı: $data');
    },
    failure: (error) {
      print('Hata oluştu: ${NetworkExceptions.getErrorMessage(error)}');
    },
  );
}
```

## API Referansı

### DataState

`DataState` sınıfı, bir ağ çağrısının sonucunu temsil eder. İki durumu vardır:

* `DataState.success(T data)`: Başarılı bir çağrıyı temsil eder.
* `DataState.failure(NetworkExceptions error)`: Başarısız bir çağrıyı temsil eder.

### NetworkExceptions

`NetworkExceptions` sınıfı, çeşitli ağ hatalarını temsil eder. Bazı yaygın hatalar şunlardır:

* `RequestCancelled`
* `UnauthorizedRequest`
* `BadRequest`
* `NotFound`
* `MethodNotAllowed`
* `NotAcceptable`
* `RequestTimeout`
* `SendTimeout`
* `Conflict`
* `InternalServerError`
* `NotImplemented`
* `ServiceUnavailable`
* `NoInternetConnection`
* `FormatException`
* `UnableToProcess`
* `DefaultError`
* `UnexpectedError`

### NetworkStateManager

`NetworkStateManager` sınıfı, ağ çağrılarını yönetmek için yardımcı bir sınıftır. Şu metodu içerir:

* `static Future<DataState<T>> handleNetworkCall<T>({required Future<T> Function() call})`: Bir ağ çağrısını yönetir ve sonucu `DataState` olarak döndürür.

## Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Daha fazla bilgi için [LICENSE](LICENSE) dosyasına bakın.