extern void *func_020724c8(int a, int b, int c);
extern void  func_02072384(void *p, int b);
extern void  func_02072370(void *p, int b);
extern void  func_020919d8(void *p);
extern void  func_02072234(int a, int b, int c, int d);

void func_02071a74(int arg0, int arg1, int arg2) {
    char *ptr = (char *)func_020724c8(arg0, arg1, arg2);

    if (ptr == 0) {
        return;
    }

    switch (*(unsigned char *)(ptr + 0x8)) {
    case 7:
        *(int *)(ptr + 0x24) += 1;
        func_02072384(ptr, 0);
        *(unsigned char *)(ptr + 0x8) = 9;
        break;
    case 8:
        *(int *)(ptr + 0x24) += 1;
        func_02072384(ptr, 0);
        *(unsigned char *)(ptr + 0x8) = 0;
        if (*(int *)(ptr + 0x4) == 2) {
            *(int *)(ptr + 0x4) = 0;
            func_020919d8(*(void **)ptr);
        }
        break;
    case 4:
        *(int *)(ptr + 0x24) += 1;
        func_02072370(ptr, 0);
        *(unsigned char *)(ptr + 0x8) = 6;
        break;
    default:
        func_02072234(arg0, arg1, arg2, 0);
        break;
    }
}
