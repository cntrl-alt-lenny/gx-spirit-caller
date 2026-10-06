struct Bit10 { unsigned int pad : 10; unsigned int b : 1; };

extern char *GetSystemWork(void);
extern int func_0201a824(void);
extern int func_0200a704(void);
extern int func_0200a928(void);
extern int func_0200a68c(int i);
extern int func_0200a8b0(int i);

unsigned int func_0201a84c(int mode) {
    char *w = GetSystemWork();
    unsigned int flags = 0;
    int i;

    switch (mode) {
    case 0:
        if (func_0201a824() == 0) {
            flags |= 0x400;
        } else {
            if (((struct Bit10 *)(w + 0x8e8))->b == 0) {
                *(unsigned int *)(w + 0x8e8) |= 0x400;
                flags |= 0x800;
            } else {
                if (func_0200a704() != 0) {
                    flags |= 0x1000;
                }
                if (func_0200a928() != 0) {
                    flags |= 0x2000;
                }
            }
            if (flags == 0) {
                flags |= 0x4000;
            }
        }
        break;
    case 1:
        if (func_0201a824() != 0) {
            for (i = 0; i < 3; i++) {
                flags |= func_0200a68c(i) << (i + 0xf);
            }
            for (i = 0; i < 3; i++) {
                flags |= func_0200a8b0(i) << (i + 0x12);
            }
            flags |= 0x200000;
        }
        break;
    }
    return flags;
}
