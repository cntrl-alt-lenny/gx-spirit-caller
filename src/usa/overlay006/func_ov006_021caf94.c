/* func_ov006_021caf94: release and clear up to 5 live handles in an array;
 * return 1. */
extern void func_02006e00(int h);
int func_ov006_021caf94(int *arr) {
    int i;
    for (i = 0; i < 5; i++) {
        if (arr[i] != 0) {
            func_02006e00(arr[i]);
            arr[i] = 0;
        }
    }
    return 1;
}
