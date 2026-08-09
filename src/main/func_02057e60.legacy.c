extern void func_020a6d54(void *p1, void *p2, int a, int b);
extern int func_02054140(int v);
extern int func_02057f3c(void *a0, int f8, int *pArg2, int flag, int *out1, int *out2, void *p3);
extern int func_020581a8(void *a0, void *p, signed char b);

extern char data_021001cc[];
extern char data_021000d0[];
extern char data_021001f0[];

int func_02057e60(void *arg0, void *arg1, int arg2, int arg3) {
    int result;

    if (*(int *)((char *)arg1 + 0x28) == 0) {
        func_020a6d54(data_021001cc, data_021000d0, 0, 0xde);
    }
    if ((*(int *)((char *)arg1 + 0x30) - *(int *)((char *)arg1 + 0x34)) != 0) {
        goto tail;
    }
    if (func_02054140(*(int *)((char *)arg1 + 0x38)) != 0) {
        goto tail;
    }
    {
        int out1, out2;
        result = func_02057f3c(arg0, *(int *)((char *)arg1 + 0x8), &arg2, 1, &out1, &out2, data_021001f0);
        if (result != 0) {
            return result;
        }
        if (out2 != 0) {
            return 0;
        }
    }
tail:
    return func_020581a8(arg0, (char *)arg1 + 0x28, *(signed char *)&arg2);
}
