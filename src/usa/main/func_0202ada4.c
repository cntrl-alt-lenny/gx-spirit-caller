/* func_0202ada4: store + tail Fill32(0, a0, 60). */
extern int Fill32(void *dst, int value, int size);
extern char data_0219a85c[];
int func_0202ada4(int a0) {
    *(int *)data_0219a85c = a0;
    return Fill32(0, a0, 60);
}
