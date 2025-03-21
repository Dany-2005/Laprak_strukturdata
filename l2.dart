void main() {
  List<num> data = List.generate(10, (index) => (index + 1).toDouble());

  print('Data sebelum sorting:');
  printData(data);

  // Sorting secara ascending
  DateTime startTimeAsc = DateTime.now();
  mergeSort(data, 0, data.length - 1, descending: false);
  Duration elapsedTimeAsc = DateTime.now().difference(startTimeAsc);
  print('\nData setelah sorting (Ascending):');
  printData(data);
  print('Waktu (Ascending): ${elapsedTimeAsc.inMilliseconds} ms\n');

  // Sorting secara descending
  DateTime startTimeDesc = DateTime.now();
  mergeSort(data, 0, data.length - 1, descending: true);
  Duration elapsedTimeDesc = DateTime.now().difference(startTimeDesc);
  print('\nData setelah sorting (Descending):');
  printData(data);
  print('Waktu (Descending): ${elapsedTimeDesc.inMilliseconds} ms');
}

// Merge Sort dengan opsi ascending/descending
void mergeSort<T extends Comparable<T>>(List<T> arr, int l, int r, {bool descending = false}) {
  if (l < r) {
    int med = (l + r) ~/ 2;
    mergeSort(arr, l, med, descending: descending);
    mergeSort(arr, med + 1, r, descending: descending);

    if (descending) {
      mergeDescending(arr, l, med, r);
    } else {
      mergeAscending(arr, l, med, r);
    }
  }
}

// Merge untuk ascending
void mergeAscending<T extends Comparable<T>>(List<T> arr, int left, int median, int right) {
  List<T?> temp = List.filled(arr.length, null);
  int kiri1 = left, kanan1 = median, kiri2 = median + 1, kanan2 = right, i = left;

  while (kiri1 <= kanan1 && kiri2 <= kanan2) {
    if (arr[kiri1].compareTo(arr[kiri2]) <= 0) {
      temp[i++] = arr[kiri1++];
    } else {
      temp[i++] = arr[kiri2++];
    }
  }

  while (kiri1 <= kanan1) temp[i++] = arr[kiri1++];
  while (kiri2 <= kanan2) temp[i++] = arr[kiri2++];

  for (int j = left; j <= right; j++) arr[j] = temp[j]!;
}

// Merge untuk descending
void mergeDescending<T extends Comparable<T>>(List<T> arr, int left, int median, int right) {
  List<T?> temp = List.filled(arr.length, null);
  int kiri1 = left, kanan1 = median, kiri2 = median + 1, kanan2 = right, i = left;

  while (kiri1 <= kanan1 && kiri2 <= kanan2) {
    if (arr[kiri1].compareTo(arr[kiri2]) >= 0) {
      temp[i++] = arr[kiri1++];
    } else {
      temp[i++] = arr[kiri2++];
    }
  }

  while (kiri1 <= kanan1) temp[i++] = arr[kiri1++];
  while (kiri2 <= kanan2) temp[i++] = arr[kiri2++];

  for (int j = left; j <= right; j++) arr[j] = temp[j]!;
}

// Fungsi untuk mencetak data
void printData<T>(List<T> data) {
  print(data.join(' '));
}
