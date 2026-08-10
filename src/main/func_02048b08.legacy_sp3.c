extern int func_0204918c(int i);
extern int func_02053650(void *slot);
extern void func_02048bc0(void *arr, int i, int j);
extern void *data_0219dc80;

int func_02048b08(void *arr, int count, int target) {
    int i;

    for (i = 0; i < count; i++) {
        int val = func_0204918c(i);
        if (val != 0 && val == target) {
            if (func_02053650((char *)arr + count * 0xc) &&
                !func_02053650((char *)arr + i * 0xc)) {
                func_02048bc0(arr, i, count);
            } else {
                func_02048bc0(arr, count, i);
            }
            *((char *)data_0219dc80 + 0x1d) = 1;
            return 1;
        }
    }
    return 0;
}
