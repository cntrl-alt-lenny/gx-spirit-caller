extern char *GetSystemWork(void);
/* These forwarders preserve r0, which the original caller consumes. */
extern int func_020139c4(void);
extern int func_020190ec(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern void func_0201aabc(int id);
/* Assembly body consumes r0 despite its void parameter list. */
extern void func_0201aaf4(int id);
extern void func_0201b708(int arg);
extern void func_0201b730(int a0);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b : 1; };
void func_0201660c(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        *(int *)((char *)o + 8) = 0x001b0100;
        func_0201aabc(0x78);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 2:
        if (func_0201b7e0(o) != 3) return;
        if (func_02019664() != 0x78) return;
        *(int *)((char *)o + 8) = 0x001b0200;
        func_0201aaf4(0x78);
        func_0201b708(0xa);
        return;
    case 3:
        if (func_02019664() != 0x6f) return;
        *(int *)((char *)o + 8) = 0x001b0300;
        func_0201b7b4();
        *(int *)(w + 0x900) &= ~0x1000000;
        return;
    case 4:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x6f) return;
            if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
            *(int *)((char *)o + 8) = 0x001b0400;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x001b0401;
                return;
            } else {
                *(int *)((char *)o + 8) = 0x001b0402;
                return;
            }
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x001b0403;
            func_0201b730(0xa);
            return;
        }
        return;
    }
}

