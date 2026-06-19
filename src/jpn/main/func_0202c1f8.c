/* func_0202c1f8: store + tail Fill32(0, a0, 12). */
extern int Fill32(void *dst, int value, int size);
extern char data_0219a85c[];
int func_0202c1f8(int a0) {
    *(int *)(data_0219a85c + 4) = a0;
    return Fill32(0, a0, 12);
}
