extern void *func_020723e0(int a, int b, int c);
extern void  func_0207229c(void *p, int b);
extern void  func_02072288(void *p, int b);
extern void  func_020918f0(void *p);
extern void  func_0207214c(int a, int b, int c, int d);

void func_0207198c(int arg0, int arg1, int arg2) {
    char *ptr = (char *)func_020723e0(arg0, arg1, arg2);

    if (ptr == 0) {
        return;
    }

    switch (*(unsigned char *)(ptr + 0x8)) {
    case 7:
        *(int *)(ptr + 0x24) += 1;
        func_0207229c(ptr, 0);
        *(unsigned char *)(ptr + 0x8) = 9;
        break;
    case 8:
        *(int *)(ptr + 0x24) += 1;
        func_0207229c(ptr, 0);
        *(unsigned char *)(ptr + 0x8) = 0;
        if (*(int *)(ptr + 0x4) == 2) {
            *(int *)(ptr + 0x4) = 0;
            func_020918f0(*(void **)ptr);
        }
        break;
    case 4:
        *(int *)(ptr + 0x24) += 1;
        func_02072288(ptr, 0);
        *(unsigned char *)(ptr + 0x8) = 6;
        break;
    default:
        func_0207214c(arg0, arg1, arg2, 0);
        break;
    }
}
