extern char *GetSystemWork(void);
extern void func_02018a38(unsigned int value);
extern void func_02018a64(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
/* Assembly implementation consumes r0 despite its void parameter list. */
extern void func_0201aaf4(int value);
extern void func_0201b708(int arg);
extern void func_0201b730(int a0);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);

struct Bit0 { unsigned int b : 1; };

void func_02016b60(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_0201b7e0(o) != 3) return;
        if (func_02019664() != 0x7a) return;
        *(int *)((char *)o + 8) = 0x001e0100;
        func_0201aaf4(0x7a);
        return;
    case 2:
        if (func_0201b7e0(o) == 4)
            *(int *)((char *)o + 8) = 0x001e0200;
        return;
    case 3:
        *(int *)((char *)o + 8) = 0x001e0300;
        *(int *)(w + 0x900) |= 0x1000000;
        func_02018a38(0x14);
        func_0201b708(0xc);
        return;
    case 4:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x71) return;
            *(int *)((char *)o + 8) = 0x001e0400;
            func_02018a64();
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x001e0401;
                return;
            } else {
                *(int *)((char *)o + 8) = 0x001e0402;
                return;
            }
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x001e0403;
            *(int *)(w + 0x900) &= ~0x1000000;
            func_0201b7b4();
            func_0201b730(0xc);
            return;
        }
        return;
    }
}

