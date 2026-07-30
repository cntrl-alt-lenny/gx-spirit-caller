extern int func_02045280(void);
extern void *func_020498f0(void);
extern int func_020469b4(void);
extern void func_0204f820(void);

int func_02051d84(void (*fn)(int), int arg) {
    if (func_02045280() != 0) goto fail;
    if (func_020498f0() == 0) goto fail;
    if (*((unsigned char *)func_020498f0() + 0x15) != 2) goto fail;

    if (func_020469b4() == 5) goto ok;
    if (func_020469b4() == 6) goto ok;

fail:
    return 0;

ok:
    if (*(int *)((char *)func_020498f0() + 0x1a0) == 0xa) {
        void *p = func_020498f0();
        *((unsigned char *)p + 0x16) = *((unsigned char *)func_020498f0() + 0xd);
        func_0204f820();
        if (fn != 0) {
            fn(arg);
        }
    } else {
        *(void **)((char *)func_020498f0() + 0x47c) = (void *)fn;
        *(int *)((char *)func_020498f0() + 0x480) = arg;
        *((unsigned char *)func_020498f0() + 0x1ae) = 1;
    }
    return 1;
}
