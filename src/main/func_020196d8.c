extern char *GetSystemWork(void);
extern char *func_02018b94(void);
extern int func_02018f80(void);
extern char data_020b5b80[];

struct SysWork14 { unsigned int val : 8; };

int func_020196d8(void) {
    unsigned int val;
    int r4;

    (void)GetSystemWork();
    val = ((struct SysWork14 *)(func_02018b94() + 0x14))->val;

    switch (val) {
    case 0x38:
        return func_02018f80() < 0x2d ? 1 : 0;
    case 0x36:
        return func_02018f80() <= 0x1b ? 1 : 0;
    case 0x37:
        return func_02018f80() <= 0x1c ? 1 : 0;
    case 0x3b:
        return func_02018f80() <= 0x21 ? 1 : 0;
    }

    r4 = 1;
    val = ((struct SysWork14 *)(func_02018b94() + 0x14))->val;
    if ((signed char)data_020b5b80[val * 7] != 2) {
        int flags = *(int *)(func_02018b94() + 0x10);
        if ((flags & 0x200) == 0) r4 = 0;
    }
    return r4;
}
