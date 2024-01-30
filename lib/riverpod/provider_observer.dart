import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    // TODO: implement didUpdateProvider
    print(
        '[Provider Updated] provider: $provider / pv: $previousValue / nv: $newValue');

    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    // TODO: implement didAddProvider
    print('[Provider Added] provider: $provider / value: $value');

    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    // TODO: implement didDisposeProvider
    print('[Provider Disposed] provider: $provider');

    super.didDisposeProvider(provider, container);
  }
}
