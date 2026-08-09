extern void *func_020498f0(void);
extern int func_0204918c(int a);

int func_0204b280(int target) {
    int i;

    if (*(int *)((char *)func_020498f0() + 0x2fc) == 0) {
        return 0;
    }

    for (i = 0; i < *(int *)((char *)func_020498f0() + 0x344); i++) {
        int ret = func_0204918c(*(unsigned char *)((char *)func_020498f0() + i + 0x304));
        if (ret > 0 && ret == target) {
            return 1;
        }
    }
    return 0;
}
