/* func_0202c490: store + tail Fill32(0, a0, 4). */
extern int Fill32(void *dst, int value, int size);
extern char data_0219a93c[];
int func_0202c490(int a0) {
    *(int *)(data_0219a93c + 8) = a0;
    return Fill32(0, a0, 4);
}
