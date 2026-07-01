extern char *GetSystemWork(void);
extern void *__sinit_ov007_021b2f64(void *);
extern char data_020c5cf4[];
extern char data_020c5d08[];
extern char data_020c5d20[];
extern char data_020c5d38[];
extern char data_020c5d4c[];
extern char data_020c5d60[];
extern char data_020c5d78[];

int func_0201bc3c(int flags, int sub) {
    char *sys;

    sys = GetSystemWork();
    if (flags & 0x4000) {
        *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5cf4);
    } else if (flags & 0x8000) {
        if (sub) {
            *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5d08);
        } else {
            *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5d20);
        }
        *(int *)(sys + 0x918) = 4;
    } else if (flags & 0x10000) {
        if (sub) {
            *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5d38);
        } else {
            *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5d4c);
        }
        *(int *)(sys + 0x918) = 3;
    } else if (flags & 0x20000) {
        if (sub) {
            *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5d60);
            *(int *)(sys + 0x918) = 3;
        } else {
            *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5d78);
            *(int *)(sys + 0x918) = 4;
        }
    }

    return 1;
}
