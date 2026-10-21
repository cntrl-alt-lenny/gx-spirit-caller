extern int func_0205ffc0(int *p, int b);
extern char data_020ffd3c[];

int func_02055f84(int *obj, int index, int a, int b) {
    char *inner;
    if (obj == 0 || (inner = (char *)*obj) == 0) return 2;
    if (index < 0 || index >= 6) {
        func_0205ffc0(obj, (int)(data_020ffd3c + 4));
        return 2;
    }
    *(int *)(inner + index * 8 + 0x1a4) = a;
    *(int *)(inner + index * 8 + 0x1a8) = b;
    return 0;
}
