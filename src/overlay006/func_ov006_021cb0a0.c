/* func_ov006_021cb0a0: release and clear up to 5 live handles in an array;
 * return 1. */
extern void Task_Invoke(int h);
int func_ov006_021cb0a0(int *arr) {
    int i;
    for (i = 0; i < 5; i++) {
        if (arr[i] != 0) {
            Task_Invoke(arr[i]);
            arr[i] = 0;
        }
    }
    return 1;
}
