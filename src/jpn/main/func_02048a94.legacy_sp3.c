extern int func_02049118(int i);
extern int func_020535dc(void *slot);
extern void func_02048b4c(void *arr, int i, int j);
extern void *data_0219dba0;

int func_02048a94(void *arr, int count, int target) {
    int i;

    for (i = 0; i < count; i++) {
        int val = func_02049118(i);
        if (val != 0 && val == target) {
            if (func_020535dc((char *)arr + count * 0xc) &&
                !func_020535dc((char *)arr + i * 0xc)) {
                func_02048b4c(arr, i, count);
            } else {
                func_02048b4c(arr, count, i);
            }
            *((char *)data_0219dba0 + 0x1d) = 1;
            return 1;
        }
    }
    return 0;
}
