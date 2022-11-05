part of sl_utils;

extension ListExtension<E> on List<E> {
  Iterable<T> mapWithIndex<T>(T Function(int, E) function) {
    return asMap().entries.map((entry) => function(entry.key, entry.value));
  }
}