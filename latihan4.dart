void selectionSortRightToLeft(List<int> arr, bool ascending) {
  int n = arr.length;

  for (int i = n - 1; i > 0; i--) {
    int pos = i;

    for (int j = i - 1; j >= 0; j--) {
      if ((ascending && arr[j] > arr[pos]) || (!ascending && arr[j] < arr[pos])) {
        pos = j;
      }
    }

    if (pos != i) {
      int temp = arr[i];
      arr[i] = arr[pos];
      arr[pos] = temp;
    }
  }
}

void main() {
  List<int> data1 = [5, 3, 8, 2, 1, 4];
  List<int> data2 = List.from(data1);

  print("Sebelum sorting: $data1");

  selectionSortRightToLeft(data1, true);
  print("Ascending (kanan ke kiri): $data1");

  selectionSortRightToLeft(data2, false);
  print("Descending (kanan ke kiri): $data2");
}
