void main() {
  List<num> data = List.generate(10, (index) => (index + 1).toDouble());
  print('Data sebelum sorting:');
  printData(data);

  // Mengukur waktu sorting ascending
  DateTime startTimeAsc = DateTime.now();
  quickSort(data, 0, data.length - 1);
  Duration elapsedTimeAsc = DateTime.now().difference(startTimeAsc);
  print('Data setelah sorting (Ascending):');
  printData(data);
  print('Waktu (Ascending): ${elapsedTimeAsc.inMilliseconds} ms\n');

  // Mengukur waktu sorting descending
  DateTime startTimeDesc = DateTime.now();
  quickSortDescending(data, 0, data.length - 1);
  Duration elapsedTimeDesc = DateTime.now().difference(startTimeDesc);
  print('Data setelah sorting (Descending):');
  printData(data);
  print('Waktu (Descending): ${elapsedTimeDesc.inMilliseconds} ms');
}

// Quick Sort Ascending
void quickSort<T extends Comparable<T>>(List<T> arr, int p, int r) {
  if (p < r) {
    int q = partition(arr, p, r);
    quickSort(arr, p, q);
    quickSort(arr, q + 1, r);
  }
}

int partition<T extends Comparable<T>>(List<T> arr, int p, int r) {
  T pivot = arr[p];
  int i = p, j = r;
  
  while (i <= j) {
    while (arr[j].compareTo(pivot) > 0) j--;
    while (arr[i].compareTo(pivot) < 0) i++;
    
    if (i < j) {
      swap(arr, i, j);
      i++;
      j--;
    } else {
      return j;
    }
  }
  return j;
}

// Quick Sort Descending
void quickSortDescending<T extends Comparable<T>>(List<T> arr, int p, int r) {
  if (p < r) {
    int q = partitionDescending(arr, p, r);
    quickSortDescending(arr, p, q);
    quickSortDescending(arr, q + 1, r);
  }
}

int partitionDescending<T extends Comparable<T>>(List<T> arr, int p, int r) {
  T pivot = arr[p];
  int i = p, j = r;

  while (i <= j) {
    while (arr[j].compareTo(pivot) < 0) j--; // Bandingkan agar lebih besar dulu
    while (arr[i].compareTo(pivot) > 0) i++; // Bandingkan agar lebih kecil dulu
    
    if (i < j) {
      swap(arr, i, j);
      i++;
      j--;
    } else {
      return j;
    }
  }
  return j;
}

// Fungsi tukar elemen dalam array
void swap<T>(List<T> arr, int i, int j) {
  T temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

// Fungsi cetak data
void printData<T>(List<T> data) {
  print(data.join(' '));
}
