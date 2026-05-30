/* func_0202adf8: store + tail Fill32(0, a0, 60). */
extern int Fill32(void *dst, int value, int size);
extern char data_0219a93c[];
int func_0202adf8(int a0) {
    *(int *)data_0219a93c = a0;
    return Fill32(0, a0, 60);
}
