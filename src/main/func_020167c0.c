extern char *GetSystemWork(void);
/* These forwarders preserve r0, which the original caller consumes. */
extern int func_020139c4(void);
extern int func_020190ec(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201aabc(int id);
extern void func_0201aaf4(int unused0);
extern void func_0201abb0(int n);
extern void func_0201abd4(int n);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b : 1; };
void func_020167c0(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        *(int *)((char *)o + 8) = 0x001c0100;
        func_0201aabc(0x78);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 2:
        if (func_0201b7e0(o) != 3) return;
        if (func_02019664() != 0x78) return;
        *(int *)((char *)o + 8) = 0x001c0200;
        func_0201aaf4(0x78);
        return;
    case 3:
        if (func_0201b7e0(o) == 5)
            *(int *)((char *)o + 8) = 0x001c0300;
        return;
    case 4:
        *(int *)((char *)o + 8) = 0x001c0400;
        return;
    case 5:
        *(int *)((char *)o + 8) = 0x001c0500;
        return;
    case 6:
        *(int *)((char *)o + 8) = 0x001c0600;
        *(int *)(w + 0x900) &= ~0x1000000;
        return;
    case 7:
        if (func_0201b7e0(o) != 8) return;
        *(int *)((char *)o + 8) = 0x001c0700;
        func_0201abb0(7);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 8:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 7) return;
            *(int *)((char *)o + 8) = 0x001c0800;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x001c0801;
                return;
            } else {
                *(int *)((char *)o + 8) = 0x001c0802;
                return;
            }
        case 2:
            *(int *)((char *)o + 8) = 0x001c0803;
            func_0201b7b4();
            *(int *)(w + 0x900) &= ~0x1000000;
            func_0201abd4(7);
            return;
        }
        return;
    }
}
