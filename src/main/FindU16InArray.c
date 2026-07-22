unsigned short *FindU16InArray(unsigned short *arr, unsigned short val, int count) {
    while (count != 0) {
        if (*arr == val) {
            return arr;
        }
        arr++;
        count--;
    }
    return 0;
}
