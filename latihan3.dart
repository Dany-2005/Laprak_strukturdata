void insertionSortRightToLeft(List<int> arr, bool ascending) {
  int n = arr.length;
  
  for (int i = n - 2; i >= 0; i--) {
    int key = arr[i];
    int j = i + 1;

    if (ascending) {
      // Ascending order
      while (j < n && arr[j] < key) {
        arr[j - 1] = arr[j];
        j++;
      }
    } else {
      // Descending order
      while (j < n && arr[j] > key) {
        arr[j - 1] = arr[j];
        j++;
      }
    }
    
    arr[j - 1] = key;
  }
}

void main() {
  List<int> data1 = [5, 3, 8, 2, 1, 4];
  List<int> data2 = List.from(data1);

  print("Sebelum sorting: $data1");

  insertionSortRightToLeft(data1, true);
  print("Ascending (kanan ke kiri): $data1");

  insertionSortRightToLeft(data2, false);
  print("Descending (kanan ke kiri): $data2");
}
